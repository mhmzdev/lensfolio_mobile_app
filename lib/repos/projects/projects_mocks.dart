// ignore_for_file: unused_element

part of 'projects_repo.dart';

class _ProjectsMocks {
  static Future<Map<String, dynamic>> delete(int id) {
    return Future.value({
      'status': 200,
      'message': 'Project deleted successfully!',
      'data': {},
    });
  }

  static Future<Map<String, dynamic>> update(
    int id,
    Map<String, dynamic> values,
  ) {
    final project = _projects.firstWhere(
      (p) => p['id'] == id,
      orElse: () => {},
    );
    final updatedProject = {...project, ...values};
    return Future.value({
      'status': 200,
      'message': 'Project updated successfully!',
      'data': updatedProject,
    });
  }

  static Future<Map<String, dynamic>> fetchAll(int uid) {
    final userProjects = _projects.where((p) => p['uid'] == uid).toList();
    return Future.value({
      'status': 200,
      'message': 'Projects fetched successfully!',
      'data': userProjects,
    });
  }

  static Future<Map<String, dynamic>> fetchById(int id) {
    final project = _projects.firstWhere(
      (p) => p['id'] == id,
      orElse: () => {},
    );
    return Future.value({
      'status': 200,
      'message': 'Project fetched successfully!',
      'data': project,
    });
  }

  static Future<Map<String, dynamic>> create(int uid, Map<String, dynamic> data) {
    return Future.value({
      'status': 200,
      'message': 'Project created successfully!',
      'data': {
        ...data,
        'id': _projects.length + 1,
        'uid': uid,
      },
    });
  }

  /// List of all mock projects
  static final List<Map<String, dynamic>> _projects = [
    {
      'id': 1,
      'uid': 1,
      'title': 'Lensfolio',
      'description':
          'A portfolio app for photographers and developers to showcase their work. Built with Flutter and Supabase for seamless cross-platform experience.',
      'technologies': ['Flutter', 'Dart', 'Supabase', 'PostgreSQL'],
      'image_url': 'https://picsum.photos/800/600',
      'github_url': 'https://github.com/mhmzdev',
      'live_url': 'https://mhmz.dev',
      'created_at': '2024-01-15T10:30:00.000Z',
    },
    {
      'id': 2,
      'uid': 1,
      'title': 'TaskFlow Pro',
      'description':
          'A modern task management app with real-time collaboration features. Includes kanban boards, time tracking, and team analytics.',
      'technologies': ['Flutter', 'Firebase', 'BLoC', 'Cloud Functions'],
      'image_url': 'https://picsum.photos/801/601',
      'github_url': 'https://github.com/mhmzdev',
      'live_url': null,
      'created_at': '2024-02-20T14:15:00.000Z',
    },
    {
      'id': 3,
      'uid': 2,
      'title': 'WeatherNow',
      'description':
          'Beautiful weather app with location-based forecasts, animated backgrounds, and severe weather alerts. Supports multiple locations.',
      'technologies': ['Flutter', 'REST API', 'Provider', 'Geolocator'],
      'image_url': 'https://picsum.photos/802/602',
      'github_url': null,
      'live_url': 'https://mhmz.dev',
      'created_at': '2024-03-10T09:00:00.000Z',
    },
    {
      'id': 4,
      'uid': 2,
      'title': 'CryptoTracker',
      'description':
          'Real-time cryptocurrency portfolio tracker with price alerts, market charts, and news aggregation. Track your investments effortlessly.',
      'technologies': ['Flutter', 'WebSocket', 'Hive', 'Charts'],
      'image_url': null,
      'github_url': 'https://github.com/mhmzdev',
      'live_url': null,
      'created_at': '2024-04-05T16:45:00.000Z',
    },
    {
      'id': 5,
      'uid': 1,
      'title': 'FitJourney',
      'description':
          'Comprehensive fitness tracking app with workout plans, nutrition logging, and progress analytics. Includes social features for motivation.',
      'technologies': ['Flutter', 'Supabase', 'HealthKit', 'Google Fit'],
      'image_url': null,
      'github_url': null,
      'live_url': 'https://mhmz.dev',
      'created_at': '2024-05-18T11:30:00.000Z',
    },
  ];
}
