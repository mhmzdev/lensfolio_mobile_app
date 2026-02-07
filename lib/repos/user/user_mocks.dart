// ignore_for_file: unused_element

part of 'user_repo.dart';

class _UserMocks {
  static Future<Map> generateProfile() {
    return Future.value({'message': 'mock', 'data': ''});
  }

  static Future<Map> logout() {
    return Future.value({'message': 'mock', 'data': ''});
  }

  static Future<Map<String, dynamic>> update(
    int userId,
    Map<String, dynamic> values,
  ) {
    final user = _users.firstWhere(
      (user) => user['id'] == userId,
      orElse: () => {},
    );
    final updatedUser = {
      ...user,
      ...values,
    };
    return Future.value({
      'status': 200,
      'message': 'User data updated successfully!',
      'data': updatedUser,
    });
  }

  static Future<Map<String, dynamic>> fetch(int id) {
    return Future.value({
      'status': 200,
      'message': 'User data fetched successfully!',
      'data': _users.firstWhere(
        (user) => user['id'] == id,
        orElse: () => {},
      ),
    });
  }

  /// List of all mock users
  static final List<Map<String, dynamic>> _users = [
    {
      'id': 1,
      'fullName': 'John Doe',
      'email': 'john.doe@example.com',
      'designation': 'Senior Flutter Developer',
      'cityState': 'San Francisco, CA',
      'profilePicture': 'https://picsum.photos/400',
      'about':
          'Passionate Flutter developer with 5+ years of experience building scalable mobile applications. Love creating beautiful UIs and solving complex problems.',
      'website': 'https://johndoe.dev',
      'details': {
        'phoneNumber': '+1 (555) 123-4567',
        'address': '123 Main St, San Francisco, CA 94105',
      },
      'skills': [
        'Flutter',
        'Dart',
        'Firebase',
        'REST APIs',
        'State Management',
        'CI/CD',
        'Git',
      ],
      'techStack': [
        {
          'category': 'frontend',
          'technologies': ['Flutter', 'React', 'HTML/CSS', 'JavaScript'],
        },
        {
          'category': 'backend',
          'technologies': ['Node.js', 'Express', 'Firebase Functions'],
        },
        {
          'category': 'database',
          'technologies': ['Firestore', 'PostgreSQL', 'MongoDB'],
        },
        {
          'category': 'devops',
          'technologies': ['Docker', 'GitHub Actions', 'Firebase Hosting'],
        },
      ],
      'preferredRoles': [
        'Mobile Developer',
        'Flutter Developer',
        'Full Stack Developer',
      ],
      'createdAt': '2023-01-15T10:30:00.000Z',
    },
    {
      'id': 2,
      'fullName': 'Hassam Talha',
      'email': 'hassamtalha@gmail.com',
      'designation': 'Full Stack Developer',
      'cityState': 'Karachi, Pakistan',
      'profilePicture': 'https://picsum.photos/401',
      'about':
          'Experienced full stack developer specializing in React and Node.js. Passionate about building performant web applications and mentoring junior developers.',
      'website': 'https://hassamtalha.dev',
      'details': {
        'phoneNumber': '+92 (300) 123-4567',
        'address': 'DHA Phase 5, Karachi, Pakistan',
      },
      'skills': [
        'React',
        'Node.js',
        'TypeScript',
        'MongoDB',
        'AWS',
        'Docker',
        'GraphQL',
      ],
      'techStack': [
        {
          'category': 'frontend',
          'technologies': [
            'React',
            'Next.js',
            'TypeScript',
            'Tailwind CSS',
          ],
        },
        {
          'category': 'backend',
          'technologies': ['Node.js', 'Express', 'NestJS', 'GraphQL'],
        },
        {
          'category': 'database',
          'technologies': ['MongoDB', 'Redis', 'PostgreSQL'],
        },
        {
          'category': 'devops',
          'technologies': ['AWS', 'Docker', 'Kubernetes', 'Jenkins'],
        },
      ],
      'preferredRoles': [
        'Full Stack Developer',
        'Backend Developer',
        'Team Lead',
      ],
      'createdAt': '2023-03-20T08:15:00.000Z',
    },
    {
      'id': 3,
      'fullName': 'Tayyba Adien',
      'email': 'tayybaadien@gmail.com',
      'designation': 'UI/UX Designer & Frontend Developer',
      'cityState': 'Lahore, Pakistan',
      'profilePicture': 'https://picsum.photos/402',
      'about':
          'Creative designer turned developer with a keen eye for aesthetics. I bridge the gap between design and code to create delightful user experiences.',
      'website': 'https://tayybaadien.com',
      'details': {
        'phoneNumber': '+92 (321) 987-6543',
        'address': 'Gulberg III, Lahore, Pakistan',
      },
      'skills': [
        'Figma',
        'Adobe XD',
        'Flutter',
        'React',
        'CSS/SCSS',
        'Animation',
        'Prototyping',
      ],
      'techStack': [
        {
          'category': 'frontend',
          'technologies': ['Flutter', 'React', 'Vue.js', 'Svelte'],
        },
        {
          'category': 'design',
          'technologies': ['Figma', 'Adobe XD', 'Sketch', 'Illustrator'],
        },
        {
          'category': 'other',
          'technologies': ['Framer Motion', 'GSAP', 'Lottie'],
        },
      ],
      'preferredRoles': [
        'UI/UX Designer',
        'Frontend Developer',
        'Product Designer',
      ],
      'createdAt': '2023-05-10T14:30:00.000Z',
    },
    {
      'id': 4,
      'fullName': 'Sana Ullah',
      'email': 'sanaullah@gmail.com',
      'designation': 'DevOps Engineer',
      'cityState': 'Islamabad, Pakistan',
      'profilePicture': 'https://picsum.photos/403',
      'about':
          'DevOps specialist focused on automating infrastructure and improving deployment pipelines. Strong advocate for infrastructure as code and continuous delivery.',
      'website': 'https://sanaullah.tech',
      'details': {
        'phoneNumber': '+92 (333) 456-7890',
        'address': 'F-7 Sector, Islamabad, Pakistan',
      },
      'skills': [
        'Kubernetes',
        'Docker',
        'Terraform',
        'AWS',
        'Jenkins',
        'Linux',
        'Python',
      ],
      'techStack': [
        {
          'category': 'devops',
          'technologies': [
            'Kubernetes',
            'Docker',
            'Terraform',
            'Ansible',
          ],
        },
        {
          'category': 'backend',
          'technologies': ['Python', 'Go', 'Shell Scripting'],
        },
        {
          'category': 'database',
          'technologies': ['PostgreSQL', 'MySQL', 'Redis', 'Elasticsearch'],
        },
        {
          'category': 'other',
          'technologies': ['AWS', 'GCP', 'Azure', 'Jenkins', 'GitLab CI'],
        },
      ],
      'preferredRoles': [
        'DevOps Engineer',
        'Cloud Architect',
        'Site Reliability Engineer',
      ],
      'createdAt': '2023-02-28T11:00:00.000Z',
    },
    {
      'id': 5,
      'fullName': 'Arsalan Noor',
      'email': 'arsalannoor@gmail.com',
      'designation': 'Mobile App Developer',
      'cityState': 'Dubai, UAE',
      'profilePicture': 'https://picsum.photos/404',
      'about':
          'Mobile app developer with expertise in both Flutter and React Native. Love building cross-platform apps that feel native on every platform.',
      'website': 'https://arsalannoor.io',
      'details': {
        'phoneNumber': '+971 (50) 234-5678',
        'address': 'Dubai Marina, Dubai, UAE',
      },
      'skills': [
        'Flutter',
        'React Native',
        'Swift',
        'Kotlin',
        'Firebase',
        'SQLite',
        'App Store Optimization',
      ],
      'techStack': [
        {
          'category': 'frontend',
          'technologies': [
            'Flutter',
            'React Native',
            'Swift UI',
            'Jetpack Compose',
          ],
        },
        {
          'category': 'backend',
          'technologies': ['Firebase', 'Node.js', 'REST APIs'],
        },
        {
          'category': 'database',
          'technologies': ['Firestore', 'SQLite', 'Realm', 'Hive'],
        },
        {
          'category': 'other',
          'technologies': [
            'App Store Connect',
            'Google Play Console',
            'TestFlight',
          ],
        },
      ],
      'preferredRoles': [
        'Mobile Developer',
        'Flutter Developer',
        'React Native Developer',
      ],
      'createdAt': '2023-04-18T09:45:00.000Z',
    },
    {
      'id': 6,
      'fullName': 'Sarah Waseem',
      'email': 'sarahwaseem@gmail.com',
      'designation': 'Data Scientist & ML Engineer',
      'cityState': 'Rawalpindi, Pakistan',
      'profilePicture': 'https://picsum.photos/405',
      'about':
          'Data scientist passionate about machine learning and AI. Experienced in building predictive models and deploying ML solutions in production environments.',
      'website': 'https://sarahwaseem.ai',
      'details': {
        'phoneNumber': '+92 (345) 678-9012',
        'address': 'Bahria Town, Rawalpindi, Pakistan',
      },
      'skills': [
        'Python',
        'TensorFlow',
        'PyTorch',
        'Scikit-learn',
        'Pandas',
        'SQL',
        'Data Visualization',
      ],
      'techStack': [
        {
          'category': 'backend',
          'technologies': ['Python', 'FastAPI', 'Django', 'Flask'],
        },
        {
          'category': 'database',
          'technologies': ['PostgreSQL', 'MongoDB', 'BigQuery'],
        },
        {
          'category': 'other',
          'technologies': [
            'TensorFlow',
            'PyTorch',
            'Jupyter',
            'MLflow',
          ],
        },
        {
          'category': 'devops',
          'technologies': ['Docker', 'AWS SageMaker', 'Airflow'],
        },
      ],
      'preferredRoles': [
        'Data Scientist',
        'ML Engineer',
        'AI Researcher',
      ],
      'createdAt': '2023-06-05T16:20:00.000Z',
    },
  ];

  static Future<Map> register() {
    return Future.value({'message': 'mock', 'data': ''});
  }

  /// Login with email - returns matching user data
  static Future<Map<String, dynamic>> login(String email) {
    // Find user by email
    final userData = _users.firstWhere(
      (user) => user['email'] == email,
      orElse: () => {},
    );

    // If user not found, return error
    if (userData.isEmpty) {
      return Future.value(
        {
          'status': 404,
          'message': 'User not found with email: $email',
          'data': null,
        },
      );
    }

    // Return user data
    return Future.value(
      {
        'status': 200,
        'message': 'User has been logged in!',
        'data': userData,
      },
    );
  }
}
