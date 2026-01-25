// ignore_for_file: unused_element

part of 'cover_letter_repo.dart';

class _CoverLetterMocks {
  static Future<Map<String, dynamic>> save(Map<String, dynamic> payload) {
    final newLetter = {
      'id': _nextId++,
      'uid': payload['uid'] as int,
      'letter': payload['letter'] as Map<String, dynamic>,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };
    _mockLetters.add(newLetter);
    return Future.value(newLetter);
  }

  static final List<Map<String, dynamic>> _mockLetters = [
    // UID 1 - 2 letters
    {
      'id': 1,
      'uid': 1,
      'letter': {
        'company_name': 'Google',
        'position': 'Senior Software Engineer',
        'job_description':
            'We are looking for a Senior Software Engineer to join our team. You will work on developing scalable applications using modern technologies.',
        'letter_body':
            'Dear Hiring Manager,\n\nI am writing to express my strong interest in the Senior Software Engineer position at Google. With over 5 years of experience in developing scalable applications and a proven track record of delivering high-quality software solutions, I am excited about the opportunity to contribute to your innovative team.\n\nThroughout my career, I have specialized in building robust backend systems and microservices architectures. My experience with modern technologies including Kubernetes, Docker, and cloud platforms aligns perfectly with Google\'s cutting-edge development environment. I am particularly drawn to Google\'s commitment to pushing the boundaries of technology and solving complex problems at scale.\n\nI would welcome the opportunity to discuss how my technical expertise and passion for innovation can contribute to Google\'s continued success.\n\nThank you for considering my application.\n\nBest regards',
        'candidate_name': 'John Developer',
        'target_seniority': 'Senior',
        'skills': ['Python', 'Java', 'Kubernetes', 'Docker'],
        'tools': ['Git', 'Jenkins', 'AWS'],
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 15).toIso8601String(),
      'updated_at': DateTime(2024, 1, 15).toIso8601String(),
    },
    {
      'id': 2,
      'uid': 1,
      'letter': {
        'company_name': 'Meta',
        'position': 'Frontend Developer',
        'job_description': null,
        'letter_body':
            'Dear Hiring Team,\n\nI am excited to apply for the Frontend Developer position at Meta. As a passionate frontend engineer with extensive experience in React, TypeScript, and modern web technologies, I am eager to contribute to building the next generation of social experiences.\n\nMy expertise includes creating responsive, accessible, and performant user interfaces that delight users. I have a strong understanding of frontend architecture patterns, state management, and optimization techniques that ensure exceptional user experiences across all devices.\n\nI admire Meta\'s mission to bring the world closer together through technology, and I would be thrilled to be part of the team making that vision a reality.\n\nThank you for your time and consideration.\n\nSincerely',
        'candidate_name': 'Jane Smith',
        'target_seniority': 'Mid-level',
        'skills': ['React', 'TypeScript', 'JavaScript', 'CSS'],
        'tools': ['Webpack', 'Redux', 'Jest'],
        'tone': 'enthusiastic',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 18).toIso8601String(),
      'updated_at': DateTime(2024, 1, 18).toIso8601String(),
    },
    // UID 2 - 2 letters
    {
      'id': 3,
      'uid': 2,
      'letter': {
        'company_name': 'Amazon',
        'position': 'Full Stack Developer',
        'job_description':
            'Join our team to build innovative e-commerce solutions. Experience with AWS and microservices is a plus.',
        'letter_body':
            'Dear Amazon Hiring Team,\n\nI am writing to apply for the Full Stack Developer position. With comprehensive experience in both frontend and backend development, combined with hands-on expertise in AWS services and microservices architecture, I am confident I can make significant contributions to Amazon\'s e-commerce innovations.\n\nMy background includes building scalable web applications, implementing RESTful APIs, and deploying cloud-native solutions on AWS. I have worked extensively with modern frameworks and have a deep understanding of database design, caching strategies, and system optimization.\n\nI am excited about the prospect of joining Amazon and contributing to the platform that millions of customers rely on daily.\n\nThank you for considering my application.\n\nBest regards',
        'target_seniority': 'Mid-level',
        'skills': ['Node.js', 'React', 'AWS', 'PostgreSQL'],
        'tools': ['Docker', 'Terraform', 'Git'],
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 20).toIso8601String(),
      'updated_at': DateTime(2024, 1, 20).toIso8601String(),
    },
    {
      'id': 4,
      'uid': 2,
      'letter': {
        'company_name': 'Microsoft',
        'position': 'Cloud Solutions Architect',
        'job_description': null,
        'letter_body':
            'Dear Microsoft Recruitment Team,\n\nI am thrilled to submit my application for the Cloud Solutions Architect position at Microsoft. With extensive experience in designing and implementing cloud infrastructure solutions, I am eager to help enterprises leverage the power of Azure to transform their businesses.\n\nMy expertise encompasses cloud architecture design, migration strategies, security best practices, and cost optimization. I have successfully led multiple cloud transformation projects, helping organizations modernize their infrastructure and improve operational efficiency.\n\nMicrosoft\'s leadership in cloud computing and commitment to innovation make this an ideal opportunity for me to apply my skills and continue growing as a cloud architect.\n\nI look forward to the opportunity to discuss how I can contribute to your team.\n\nSincerely',
        'candidate_location': 'Seattle, WA',
        'target_seniority': 'Senior',
        'skills': ['Azure', 'Cloud Architecture', 'DevOps', 'Security'],
        'tools': ['ARM Templates', 'PowerShell', 'Kubernetes'],
        'tone': 'professional',
        'length': 'long',
      },
      'created_at': DateTime(2024, 1, 22).toIso8601String(),
      'updated_at': DateTime(2024, 1, 22).toIso8601String(),
    },
    // UID 3 - 3 letters
    {
      'id': 5,
      'uid': 3,
      'letter': {
        'company_name': 'Apple',
        'position': 'iOS Developer',
        'job_description':
            'Build exceptional user experiences for millions of users. Strong knowledge of Swift and UIKit required.',
        'letter_body':
            'Dear Apple Hiring Manager,\n\nI am excited to apply for the iOS Developer position at Apple. As a dedicated iOS developer with deep expertise in Swift, UIKit, and SwiftUI, I am passionate about crafting elegant user experiences that Apple is renowned for.\n\nMy experience includes developing performant, accessible iOS applications following Apple\'s Human Interface Guidelines. I have a strong understanding of iOS frameworks, design patterns like MVVM and Clean Architecture, and performance optimization techniques.\n\nApple\'s commitment to excellence and user privacy aligns perfectly with my values as a developer. I would be honored to contribute to products that touch millions of lives every day.\n\nThank you for considering my application.\n\nBest regards',
        'candidate_name': 'Alex Johnson',
        'candidate_location': 'Cupertino, CA',
        'target_seniority': 'Mid-level',
        'skills': ['Swift', 'UIKit', 'SwiftUI', 'CoreData'],
        'tools': ['Xcode', 'Git', 'Instruments'],
        'portfolio_url': 'https://portfolio.example.com',
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 25).toIso8601String(),
      'updated_at': DateTime(2024, 1, 25).toIso8601String(),
    },
    {
      'id': 6,
      'uid': 3,
      'letter': {
        'company_name': 'Netflix',
        'position': 'Backend Engineer',
        'job_description': null,
        'letter_body':
            'Dear Netflix Engineering Team,\n\nI am writing to express my interest in the Backend Engineer position at Netflix. With strong experience in building distributed systems and streaming technologies, I am excited about the opportunity to work on the infrastructure that powers entertainment for millions globally.\n\nMy background includes developing high-performance backend services, implementing efficient data pipelines, and optimizing system reliability. I have experience with microservices architecture, message queues, and designing systems for scale and resilience.\n\nNetflix\'s engineering culture of freedom and responsibility, combined with the technical challenges of streaming at scale, makes this an ideal opportunity for me to contribute and grow.\n\nI look forward to discussing this opportunity further.\n\nSincerely',
        'target_seniority': 'Senior',
        'skills': ['Java', 'Spring Boot', 'Microservices', 'Kafka'],
        'tools': ['Kubernetes', 'Cassandra', 'Redis'],
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 28).toIso8601String(),
      'updated_at': DateTime(2024, 1, 28).toIso8601String(),
    },
    {
      'id': 7,
      'uid': 3,
      'letter': {
        'company_name': 'Spotify',
        'position': 'Mobile Developer',
        'job_description':
            'Create amazing music streaming experiences. Experience with Flutter or React Native preferred.',
        'letter_body':
            'Dear Spotify Team,\n\nI am thrilled to apply for the Mobile Developer position at Spotify. With extensive experience in Flutter development and a passion for music technology, I am eager to contribute to creating exceptional mobile experiences that connect millions of users with the music they love.\n\nMy expertise includes building cross-platform mobile applications, implementing real-time features, offline capabilities, and smooth animations. I have a strong understanding of mobile architecture patterns and performance optimization techniques essential for media streaming applications.\n\nSpotify\'s mission to unlock the potential of human creativity resonates deeply with me, and I would be honored to help shape the future of music streaming.\n\nThank you for your consideration.\n\nBest regards',
        'candidate_name': 'Maria Garcia',
        'target_seniority': 'Mid-level',
        'skills': ['Flutter', 'Dart', 'React Native', 'Mobile UI/UX'],
        'tools': ['Firebase', 'GraphQL', 'Git'],
        'portfolio_url': 'https://github.com/mariagarcia',
        'tone': 'enthusiastic',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 1, 30).toIso8601String(),
      'updated_at': DateTime(2024, 1, 30).toIso8601String(),
    },
    // UID 4 - 2 letters
    {
      'id': 8,
      'uid': 4,
      'letter': {
        'company_name': 'Tesla',
        'position': 'Software Engineer',
        'job_description': null,
        'letter_body':
            'Dear Tesla Hiring Team,\n\nI am excited to apply for the Software Engineer position at Tesla. With a strong foundation in software development and a passion for sustainable technology, I am eager to contribute to Tesla\'s mission of accelerating the world\'s transition to sustainable energy.\n\nMy experience includes developing embedded systems, working with real-time data processing, and building robust software solutions. I thrive in fast-paced environments where innovation and technical excellence are paramount.\n\nTesla\'s groundbreaking work in electric vehicles and energy solutions represents the future I want to help build. I would be honored to bring my skills and dedication to your team.\n\nThank you for considering my application.\n\nBest regards',
        'candidate_name': 'David Chen',
        'candidate_location': 'Austin, TX',
        'target_seniority': 'Mid-level',
        'skills': ['C++', 'Python', 'Embedded Systems', 'Real-time Processing'],
        'tools': ['Linux', 'RTOS', 'Git'],
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 2, 1).toIso8601String(),
      'updated_at': DateTime(2024, 2, 1).toIso8601String(),
    },
    {
      'id': 9,
      'uid': 4,
      'letter': {
        'company_name': 'Airbnb',
        'position': 'Product Engineer',
        'job_description':
            'Help build the future of travel. You will work on features that impact millions of hosts and guests worldwide.',
        'letter_body':
            'Dear Airbnb Team,\n\nI am writing to express my strong interest in the Product Engineer position at Airbnb. With experience in full-stack development and a user-centric approach to building products, I am excited about the opportunity to help shape the future of travel and create meaningful experiences for hosts and guests worldwide.\n\nMy background combines technical expertise with a deep understanding of user needs. I have worked on features from conception to launch, collaborating closely with designers and product managers to deliver solutions that delight users and drive business value.\n\nAirbnb\'s mission to create a world where anyone can belong anywhere deeply resonates with me, and I would be thrilled to contribute to that vision.\n\nThank you for your time and consideration.\n\nSincerely',
        'candidate_name': 'Sarah Williams',
        'target_seniority': 'Senior',
        'skills': ['React', 'Node.js', 'Product Development', 'UX'],
        'tools': ['Figma', 'Git', 'Jira'],
        'portfolio_url': 'https://sarahwilliams.dev',
        'tone': 'friendly',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 2, 3).toIso8601String(),
      'updated_at': DateTime(2024, 2, 3).toIso8601String(),
    },
    // UID 5 - 2 letters
    {
      'id': 10,
      'uid': 5,
      'letter': {
        'company_name': 'Uber',
        'position': 'Mobile Engineer',
        'job_description':
            'Build scalable mobile applications used by millions. Strong knowledge of mobile architecture patterns required.',
        'letter_body':
            'Dear Uber Engineering Team,\n\nI am excited to apply for the Mobile Engineer position at Uber. With extensive experience in building scalable mobile applications and a strong command of mobile architecture patterns, I am eager to contribute to the platform that connects millions of riders and drivers every day.\n\nMy expertise includes developing high-performance mobile apps, implementing clean architecture patterns, and ensuring exceptional user experiences across different devices and network conditions. I have worked on location-based features, real-time tracking, and optimizing apps for reliability and performance at scale.\n\nUber\'s impact on urban mobility and commitment to solving complex technical challenges makes this an ideal opportunity for me to apply my skills and grow as an engineer.\n\nThank you for considering my application.\n\nBest regards',
        'candidate_name': 'Michael Brown',
        'candidate_location': 'San Francisco, CA',
        'target_seniority': 'Senior',
        'skills': ['iOS', 'Android', 'Kotlin', 'Swift'],
        'tools': ['Firebase', 'Google Maps API', 'Git'],
        'tone': 'professional',
        'length': 'medium',
      },
      'created_at': DateTime(2024, 2, 5).toIso8601String(),
      'updated_at': DateTime(2024, 2, 5).toIso8601String(),
    },
    {
      'id': 11,
      'uid': 5,
      'letter': {
        'company_name': 'Stripe',
        'position': 'Senior Backend Developer',
        'job_description': null,
        'letter_body':
            'Dear Stripe Team,\n\nI am writing to apply for the Senior Backend Developer position at Stripe. With deep expertise in building secure, scalable backend systems and a passion for financial technology, I am excited about the opportunity to work on the infrastructure that powers internet commerce.\n\nMy experience includes designing and implementing RESTful APIs, working with payment systems, ensuring data security and compliance, and building systems that handle high transaction volumes with reliability. I have a strong understanding of distributed systems, database optimization, and microservices architecture.\n\nStripe\'s mission to increase the GDP of the internet and commitment to developer experience aligns perfectly with my values and aspirations as an engineer.\n\nI look forward to the opportunity to discuss how I can contribute to your team.\n\nSincerely',
        'candidate_name': 'Emily Zhang',
        'target_seniority': 'Senior',
        'skills': ['Ruby', 'Go', 'PostgreSQL', 'Redis'],
        'tools': ['Kubernetes', 'Git', 'Datadog'],
        'portfolio_url': 'https://github.com/emilyzhang',
        'tone': 'professional',
        'length': 'long',
      },
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
    // payload now contains the letter object with all nested fields
    final letterData = payload['letter'] as Map<String, dynamic>?;

    if (letterData == null) {
      throw Exception('Letter data is required');
    }

    final newLetter = {
      'id': _nextId++,
      'uid': payload['uid'] as int,
      'letter': letterData,
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

    final currentLetter = _mockLetters[index];
    final currentLetterData = currentLetter['letter'] as Map<String, dynamic>;

    // Merge updated letter data
    final updatedLetterData = {
      ...currentLetterData,
      if (payload.containsKey('letter'))
        ...(payload['letter'] as Map<String, dynamic>),
    };

    final updatedLetter = {
      ...currentLetter,
      'letter': updatedLetterData,
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
