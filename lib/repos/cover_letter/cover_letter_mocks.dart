// ignore_for_file: unused_element

part of 'cover_letter_repo.dart';

class _CoverLetterMocks {
  static final List<Map<String, dynamic>> _mockLetters = [
    // UID 1 - 2 letters
    {
      'id': 1,
      'uid': 1,
      'company_name': 'Google',
      'position': 'Senior Software Engineer',
      'job_description':
          'We are looking for a Senior Software Engineer to join our team. You will work on developing scalable applications using modern technologies.',
      'created_at': DateTime(2024, 1, 15).toIso8601String(),
      'updated_at': DateTime(2024, 1, 15).toIso8601String(),
    },
    {
      'id': 2,
      'uid': 1,
      'company_name': 'Meta',
      'position': 'Frontend Developer',
      'job_description': null,
      'created_at': DateTime(2024, 1, 18).toIso8601String(),
      'updated_at': DateTime(2024, 1, 18).toIso8601String(),
    },
    // UID 2 - 2 letters
    {
      'id': 3,
      'uid': 2,
      'company_name': 'Amazon',
      'position': 'Full Stack Developer',
      'job_description':
          'Join our team to build innovative e-commerce solutions. Experience with AWS and microservices is a plus.',
      'created_at': DateTime(2024, 1, 20).toIso8601String(),
      'updated_at': DateTime(2024, 1, 20).toIso8601String(),
    },
    {
      'id': 4,
      'uid': 2,
      'company_name': 'Microsoft',
      'position': 'Cloud Solutions Architect',
      'job_description': null,
      'created_at': DateTime(2024, 1, 22).toIso8601String(),
      'updated_at': DateTime(2024, 1, 22).toIso8601String(),
    },
    // UID 3 - 3 letters
    {
      'id': 5,
      'uid': 3,
      'company_name': 'Apple',
      'position': 'iOS Developer',
      'job_description':
          'Build exceptional user experiences for millions of users. Strong knowledge of Swift and UIKit required.',
      'created_at': DateTime(2024, 1, 25).toIso8601String(),
      'updated_at': DateTime(2024, 1, 25).toIso8601String(),
    },
    {
      'id': 6,
      'uid': 3,
      'company_name': 'Netflix',
      'position': 'Backend Engineer',
      'job_description': null,
      'created_at': DateTime(2024, 1, 28).toIso8601String(),
      'updated_at': DateTime(2024, 1, 28).toIso8601String(),
    },
    {
      'id': 7,
      'uid': 3,
      'company_name': 'Spotify',
      'position': 'Mobile Developer',
      'job_description':
          'Create amazing music streaming experiences. Experience with Flutter or React Native preferred.',
      'created_at': DateTime(2024, 1, 30).toIso8601String(),
      'updated_at': DateTime(2024, 1, 30).toIso8601String(),
    },
    // UID 4 - 2 letters
    {
      'id': 8,
      'uid': 4,
      'company_name': 'Tesla',
      'position': 'Software Engineer',
      'job_description': null,
      'created_at': DateTime(2024, 2, 1).toIso8601String(),
      'updated_at': DateTime(2024, 2, 1).toIso8601String(),
    },
    {
      'id': 9,
      'uid': 4,
      'company_name': 'Airbnb',
      'position': 'Product Engineer',
      'job_description':
          'Help build the future of travel. You will work on features that impact millions of hosts and guests worldwide.',
      'created_at': DateTime(2024, 2, 3).toIso8601String(),
      'updated_at': DateTime(2024, 2, 3).toIso8601String(),
    },
    // UID 5 - 2 letters
    {
      'id': 10,
      'uid': 5,
      'company_name': 'Uber',
      'position': 'Mobile Engineer',
      'job_description':
          'Build scalable mobile applications used by millions. Strong knowledge of mobile architecture patterns required.',
      'created_at': DateTime(2024, 2, 5).toIso8601String(),
      'updated_at': DateTime(2024, 2, 5).toIso8601String(),
    },
    {
      'id': 11,
      'uid': 5,
      'company_name': 'Stripe',
      'position': 'Senior Backend Developer',
      'job_description': null,
      'created_at': DateTime(2024, 2, 7).toIso8601String(),
      'updated_at': DateTime(2024, 2, 7).toIso8601String(),
    },
  ];

  static int _nextId = 12;

  /// Fetch all cover letters for a specific user
  static Future<List<Map<String, dynamic>>> fetch(int uid) {
    final userLetters = _mockLetters
        .where((letter) => letter['uid'] == uid)
        .toList();
    return Future.value(userLetters);
  }

  /// Generate a new cover letter
  static Future<Map<String, dynamic>> generate(Map<String, dynamic> payload) {
    final newLetter = {
      'id': _nextId++,
      'uid': payload['uid'] as int,
      'company_name': payload['company_name'] as String,
      'position': payload['position'] as String,
      'job_description': payload['job_description'] as String?,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };

    _mockLetters.add(newLetter);
    return Future.value(newLetter);
  }

  /// Edit an existing cover letter
  static Future<Map<String, dynamic>> edit(
    int id,
    Map<String, dynamic> payload,
  ) {
    final index = _mockLetters.indexWhere((letter) => letter['id'] == id);

    if (index == -1) {
      throw Exception('Cover letter with id $id not found');
    }

    final updatedLetter = {
      ..._mockLetters[index],
      if (payload.containsKey('company_name'))
        'company_name': payload['company_name'],
      if (payload.containsKey('position')) 'position': payload['position'],
      if (payload.containsKey('job_description'))
        'job_description': payload['job_description'],
      'updated_at': DateTime.now().toIso8601String(),
    };

    _mockLetters[index] = updatedLetter;
    return Future.value(updatedLetter);
  }

  /// Delete a cover letter
  static Future<Map<String, dynamic>> delete(int id) {
    final index = _mockLetters.indexWhere((letter) => letter['id'] == id);

    if (index == -1) {
      throw Exception('Cover letter with id $id not found');
    }

    final deletedLetter = _mockLetters.removeAt(index);
    return Future.value(deletedLetter);
  }
}
