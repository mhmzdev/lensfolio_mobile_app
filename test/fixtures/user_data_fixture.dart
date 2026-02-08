import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/models/user/user_contact_details.dart';
import 'package:lensfolio_mobile_app/models/user/user_education.dart';
import 'package:lensfolio_mobile_app/models/user/user_experience.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';

/// Test fixtures for UserData
class UserDataFixture {
  UserDataFixture._();

  /// Creates a complete user profile (no incomplete fields)
  static UserData complete({
    int id = 1,
    String uid = 'test-uid-123',
    String fullName = 'John Doe',
    String email = 'john.doe@example.com',
    String? designation = 'Senior Software Engineer',
    String? cityState = 'San Francisco, CA',
    String? about = 'Experienced developer with 10+ years in mobile development.',
    String? website = 'https://johndoe.dev',
    String? resumePath = 'resumes/john-doe-resume.pdf',
    String? profilePictureUrl = 'https://example.com/avatar.jpg',
  }) {
    return UserData(
      id: id,
      uid: uid,
      fullName: fullName,
      email: email,
      designation: designation,
      cityState: cityState,
      about: about,
      website: website,
      resumePath: resumePath,
      profilePictureUrl: profilePictureUrl,
      contactDetails: const UserContactDetails(
        phoneNumber: '+1234567890',
        address: '123 Main St, San Francisco, CA',
      ),
      skills: const ['Flutter', 'Dart', 'Swift', 'Kotlin'],
      techStack: const [
        UserTechStack(
          category: TechStack.frontend,
          technologies: ['Flutter', 'React'],
        ),
        UserTechStack(
          category: TechStack.backend,
          technologies: ['Node.js', 'Python'],
        ),
      ],
      preferredRoles: const ['Mobile Developer', 'Tech Lead'],
      education: [
        UserEducation(
          school: 'MIT',
          degree: 'Computer Science',
          startDate: DateTime(2010),
          endDate: DateTime(2014),
        ),
      ],
      experience: [
        UserExperience(
          company: 'Google',
          designation: 'Senior Engineer',
          startDate: DateTime(2018),
          endDate: DateTime(2023),
          responsibilities: const ['Led mobile team', 'Built Flutter apps'],
        ),
      ],
      createdAt: DateTime(2024, 1, 1),
    );
  }

  /// Creates an incomplete user profile (missing required fields for complete profile)
  static UserData incomplete({
    int id = 1,
    String uid = 'test-uid-123',
    String fullName = 'John Doe',
    String email = 'john.doe@example.com',
  }) {
    return UserData(
      id: id,
      uid: uid,
      fullName: fullName,
      email: email,
      // All optional fields are null/empty - profile is incomplete
      createdAt: DateTime(2024, 1, 1),
    );
  }

  /// Creates a minimal user with just required fields
  static UserData minimal({
    int id = 1,
    String uid = 'test-uid-123',
    String fullName = 'Test User',
    String email = 'test@example.com',
  }) {
    return UserData(
      id: id,
      uid: uid,
      fullName: fullName,
      email: email,
      createdAt: DateTime.now(),
    );
  }
}
