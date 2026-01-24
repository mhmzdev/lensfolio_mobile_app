part of 'cover_letter_repo.dart';

class _CoverLetterProvider {
  static Future<List<CoverLetter>> fetch(int uid) async {
    try {
      final resp = await _CoverLetterMocks.fetch(uid);
      await 1.seconds.delay;
      final raw = resp as List<dynamic>;
      return raw
          .map((e) => CoverLetter.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<LetterPromptResponse> generate(
    Map<String, dynamic> data,
  ) async {
    final optionalContent = <Content>[];
    final requiredContent = <Content>[
      Content.text(data['company_name']),
      Content.text(data['position']),
      Content.text(data['job_description']),
    ];

    /// When the parser runs below, it will add company_name, position, and job_description
    /// to the optionalContent and it will cause redundant content in the prompt.
    /// So, we remove them from the payload before passing it to the parser.
    final payload = Map<String, dynamic>.from(data);
    payload.remove('company_name');
    payload.remove('position');
    payload.remove('job_description');

    try {
      payload.forEach((key, value) {
        if (value != null) {
          if (value is List) {
            optionalContent.add(Content.text('$key: ${value.join(', ')}'));
          } else if (value is Enum) {
            optionalContent.add(Content.text('$key: ${value.name}'));
          } else if (value is List<Enum>) {
            optionalContent.add(
              Content.text('$key: ${value.map((e) => e.name).join(', ')}'),
            );
          } else {
            optionalContent.add(Content.text('$key: $value'));
          }
        }
      });
    } catch (e) {
      /// failed silently
      e.appLog(level: .error, tag: 'CoverLetterProvider.generate');
    }

    try {
      final model = await getCoverLetterGenerationModel();
      final response = await model.generateContent([
        ...requiredContent,
        if (optionalContent.isNotEmpty) ...optionalContent,
      ]);

      final raw = response.text;
      final cleaned = raw!.extractJsonFromResponse;
      final parsed = jsonDecode(cleaned) as Map<String, dynamic>;

      return LetterPromptResponse.fromJson(parsed);
    } catch (e, st) {
      if (e is ServerException) {
        throw UnknownFault(e.message, st);
      }
      if (e is SocketException || e is TimeoutException) {
        throw NetworkFault(
          'Poor connectivity! Please check your internet connection.',
          st,
        );
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<CoverLetter> edit(int id, Map<String, dynamic> payload) async {
    try {
      final resp = await _CoverLetterMocks.edit(id, payload);
      await 1.seconds.delay;
      return CoverLetter.fromJson(resp);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<void> delete(int id) async {
    try {
      await _CoverLetterMocks.delete(id);
      await 1.seconds.delay;
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<GenerativeModel> getCoverLetterGenerationModel() async {
    try {
      final promptFile = await rootBundle.loadString(
        Assets.coverLetterSystemPrompt,
      );

      final model = FirebaseAI.vertexAI().generativeModel(
        model: FireRemoteConfig.ins.generativeModel,
        systemInstruction: Content.system(promptFile),
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: AgentTools.ins.coverLetterGenerationSchema,
        ),
      );
      return model;
    } catch (e) {
      throw UnknownFault(
        'Something went wrong while preparing cover letter model!',
        StackTrace.current,
      );
    }
  }
}
