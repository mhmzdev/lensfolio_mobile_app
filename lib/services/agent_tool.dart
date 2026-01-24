import 'package:firebase_ai/firebase_ai.dart';

class AgentTools {
  AgentTools._();

  static final _instance = AgentTools._();
  static AgentTools get ins => _instance;

  /// Schema for cover letter generation based on [cover_letter_system_prompt.md]
  /// This will only be used to generate a cover letter generation prompt from an AI agent
  /// based on the provided job context
  Schema get coverLetterGenerationSchema => Schema(
    SchemaType.object,
    properties: {
      'letter_body': Schema(
        SchemaType.string,
        description: 'The generated cover letter body',
        nullable: false,
      ),
      'error': Schema(
        SchemaType.string,
        description: 'The error message if the cover letter generation fails',
        nullable: true,
      ),
    },
  );
}
