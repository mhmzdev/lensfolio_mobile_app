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

  /// Schema for extract profile from resume based on [extract_profile_from_resume.md]
  /// This will only be used to extract profile from resume from an AI agent
  /// based on the provided resume file
  Schema get extractProfileFromResumeSchema => Schema(
    SchemaType.object,
    properties: {
      'profile_data': Schema(
        SchemaType.object,
        description: 'Extracted profile data from the resume',
        nullable: true,
        properties: {
          'full_name': Schema(
            SchemaType.string,
            description: 'Full name of the candidate',
            nullable: true,
          ),
          'email': Schema(
            SchemaType.string,
            description: 'Email address of the candidate',
            nullable: true,
          ),
          'designation': Schema(
            SchemaType.string,
            description: 'Current job title or professional headline',
            nullable: true,
          ),
          'city_state': Schema(
            SchemaType.string,
            description: 'Location (city, state)',
            nullable: true,
          ),
          'about': Schema(
            SchemaType.string,
            description: 'Professional summary or about section',
            nullable: true,
          ),
          'website': Schema(
            SchemaType.string,
            description: 'Personal website or portfolio URL',
            nullable: true,
          ),
          'contact_details': Schema(
            SchemaType.object,
            description: 'Contact details of the candidate',
            nullable: true,
            properties: {
              'phone_number': Schema(
                SchemaType.string,
                description: 'Phone number',
                nullable: true,
              ),
              'address': Schema(
                SchemaType.string,
                description: 'Full address',
                nullable: true,
              ),
            },
          ),
          'skills': Schema(
            SchemaType.array,
            description: 'List of skills',
            items: Schema(SchemaType.string),
            nullable: true,
          ),
          'tech_stack': Schema(
            SchemaType.array,
            description: 'Categorized technical skills',
            nullable: true,
            items: Schema(
              SchemaType.object,
              properties: {
                'category': Schema(
                  SchemaType.string,
                  description:
                      'Category: frontend, backend, database, devops, design, other',
                  nullable: false,
                ),
                'technologies': Schema(
                  SchemaType.array,
                  description: 'List of technologies in this category',
                  items: Schema(SchemaType.string),
                  nullable: false,
                ),
              },
            ),
          ),
          'preferred_roles': Schema(
            SchemaType.array,
            description: 'Preferred job roles inferred from resume',
            items: Schema(SchemaType.string),
            nullable: true,
          ),
          'education': Schema(
            SchemaType.array,
            description: 'Educational background',
            nullable: true,
            items: Schema(
              SchemaType.object,
              properties: {
                'degree': Schema(
                  SchemaType.string,
                  description: 'Degree name',
                  nullable: false,
                ),
                'school': Schema(
                  SchemaType.string,
                  description: 'Institution name',
                  nullable: false,
                ),
                'start_date': Schema(
                  SchemaType.string,
                  description: 'Start date (YYYY-MM-DD)',
                  nullable: false,
                ),
                'end_date': Schema(
                  SchemaType.string,
                  description: 'End date (YYYY-MM-DD) or null if ongoing',
                  nullable: true,
                ),
              },
            ),
          ),
          'experience': Schema(
            SchemaType.array,
            description: 'Work experience',
            nullable: true,
            items: Schema(
              SchemaType.object,
              properties: {
                'company': Schema(
                  SchemaType.string,
                  description: 'Company name',
                  nullable: false,
                ),
                'designation': Schema(
                  SchemaType.string,
                  description: 'Job title',
                  nullable: false,
                ),
                'start_date': Schema(
                  SchemaType.string,
                  description: 'Start date (YYYY-MM-DD)',
                  nullable: false,
                ),
                'end_date': Schema(
                  SchemaType.string,
                  description: 'End date (YYYY-MM-DD) or null if current',
                  nullable: true,
                ),
                'responsibilities': Schema(
                  SchemaType.array,
                  description: 'List of responsibilities/achievements',
                  items: Schema(SchemaType.string),
                  nullable: false,
                ),
              },
            ),
          ),
        },
      ),
      'extraction_confidence': Schema(
        SchemaType.string,
        description: 'Confidence level: high, medium, or low',
        nullable: true,
      ),
      'error': Schema(
        SchemaType.string,
        description: 'Error message if profile extraction fails',
        nullable: true,
      ),
    },
  );
}
