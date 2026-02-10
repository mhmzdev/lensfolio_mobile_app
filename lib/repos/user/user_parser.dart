// ignore_for_file: unused_element

part of 'user_repo.dart';

class _UserParser {
  static Map delete(Map data) => data;

  static Map generateProfile(Map data) => data;

  static Map logout(Map data) => data;

  static Map<String, dynamic> update(Map<String, dynamic> data) {
    final payload = Map<String, dynamic>.from(data);

    if (payload.containsKey('tech_stack')) {
      final techStack = payload['tech_stack'];
      if (techStack is List<UserTechStack>) {
        payload['tech_stack'] = techStack.map((e) => e.toJson()).toList();
      }
    }

    if (payload.containsKey('phone_number') || payload.containsKey('address')) {
      payload['contact_details'] = {
        'phone_number': payload['phone_number'],
        'address': payload['address'],
      };
      payload.remove('phone_number');
      payload.remove('address');
    }

    if (payload.containsKey('education')) {
      final education = payload['education'];
      if (education is List<UserEducation>) {
        payload['education'] = education.map((e) => e.toJson()).toList();
      }
    }

    if (payload.containsKey('experience')) {
      final experience = payload['experience'];
      if (experience is List<UserExperience>) {
        payload['experience'] = experience.map((e) => e.toJson()).toList();
      }
    }

    return payload;
  }

  static Map fetch(Map data) => data;

  static Map register(Map data) => data;

  static Map login(Map data) => data;
}
