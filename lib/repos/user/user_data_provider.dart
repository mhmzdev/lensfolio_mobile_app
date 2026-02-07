part of 'user_repo.dart';

class _UserProvider {
  static Future<GeneratedProfile> generateProfile(File file) async {
    try {
      final fileBytes = await file.readAsBytes();
      final model = await getProfileGenerationModel();
      final response = await model.generateContent([
        Content.inlineData('application/pdf', fileBytes),
      ]);
      final raw = response.text;
      final cleaned = raw!.extractJsonFromResponse;
      final parsed = jsonDecode(cleaned) as Map<String, dynamic>;
      final profileData = parsed['profile_data'] as Map<String, dynamic>;
      return GeneratedProfile.fromJson(profileData);
    } catch (e, st) {
      throw UnknownFault('Something went wrong during profile generation!', st);
    }
  }

  static Future<GenerativeModel> getProfileGenerationModel() async {
    try {
      final promptFile = await rootBundle.loadString(
        Assets.extractProfileFromResume,
      );

      final model = FirebaseAI.vertexAI().generativeModel(
        model: FireRemoteConfig.ins.generativeModel,
        systemInstruction: Content.system(promptFile),
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: AgentTools.ins.extractProfileFromResumeSchema,
        ),
      );
      return model;
    } catch (e) {
      throw UnknownFault(
        'Something went wrong while preparing profile generation model!',
        StackTrace.current,
      );
    }
  }

  static Future<UserData> update(Map<String, dynamic> payload) async {
    try {
      final userId = payload['id'] as int;
      final updatedUser = await AppSupabase.supabase
          .from(SupaTables.users)
          .update(payload)
          .eq('id', userId)
          .select()
          .single();

      final raw = updatedUser;
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<UserData> fetch(String email) async {
    try {
      final user = await AppSupabase.supabase
          .from(SupaTables.users)
          .select('*')
          .eq('email', email)
          .single();
      return UserData.fromJson(user);
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      if (e is PostgrestException) {
        throw SupaPostgresFault.fromPostgrestException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<AuthResponse> register(Map<String, dynamic> values) async {
    try {
      final authResponse = await AppSupabase.supabase.auth.signUp(
        email: values['email'],
        password: values['password'],
      );
      return authResponse;
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<AuthResponse> login(Map<String, dynamic> values) async {
    try {
      final authResponse = await AppSupabase.supabase.auth.signInWithPassword(
        email: values['email'],
        password: values['password'],
      );

      return authResponse;
    } catch (e, st) {
      if (e is AuthApiException) {
        throw SupaAuthFault.fromAuthApiException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
