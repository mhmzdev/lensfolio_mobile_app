// ignore_for_file: unused_element

part of 'jobs_repo.dart';

class _JobsMocks {
  static Future<Map<String, dynamic>> fetch() {
    return Future.value({
      'status': 200,
      'message': 'mock',
      'data': {
        '0-legal-notice':
            'Legal warning - Hey, thanks for using Remotive\'s API, we appreciate it!',
        'job-count': 5,
        'total-job-count': 25,
        'jobs': [
          {
            'id': 1749306,
            'url':
                'https://remotive.com/remote-jobs/software-dev/senior-flutter-developer-1749306',
            'title': 'Senior Flutter Developer',
            'company_name': 'TechVision Inc.',
            'company_logo': 'https://remotive.com/job/1749306/logo',
            'category': 'Software Development',
            'tags': [
              'flutter',
              'dart',
              'mobile development',
              'firebase',
              'rest api',
              'git',
              'agile',
            ],
            'job_type': 'full_time',
            'publication_date': '2026-01-02T20:00:34',
            'candidate_required_location': 'Worldwide',
            'salary': '\$80k - \$120k',
            'description':
                '<p>We are looking for a Senior Flutter Developer to join our remote team. You will be responsible for developing high-quality mobile applications using Flutter and Dart. Experience with state management (Provider, Bloc) and Firebase integration is required.</p>',
          },
          {
            'id': 1749307,
            'url':
                'https://remotive.com/remote-jobs/design/ui-ux-designer-1749307',
            'title': 'UI/UX Designer',
            'company_name': 'Creative Digital Studio',
            'company_logo': 'https://remotive.com/job/1749307/logo',
            'category': 'Design',
            'tags': [
              'figma',
              'sketch',
              'adobe xd',
              'prototyping',
              'user research',
              'wireframing',
            ],
            'job_type': 'contract',
            'publication_date': '2026-01-01T15:30:00',
            'candidate_required_location': 'USA, Europe',
            'salary': '\$60k - \$90k',
            'description':
                '<p>Join our creative team as a UI/UX Designer. You will design beautiful and intuitive user interfaces for mobile and web applications. Strong portfolio required.</p>',
          },
          {
            'id': 1749308,
            'url':
                'https://remotive.com/remote-jobs/software-dev/backend-engineer-1749308',
            'title': 'Backend Engineer (Node.js)',
            'company_name': 'CloudScale Solutions',
            'company_logo': 'https://remotive.com/job/1749308/logo',
            'category': 'Software Development',
            'tags': [
              'node.js',
              'express',
              'mongodb',
              'postgresql',
              'aws',
              'docker',
              'kubernetes',
            ],
            'job_type': 'full_time',
            'publication_date': '2025-12-30T09:15:22',
            'candidate_required_location': 'Worldwide',
            'salary': '\$90k - \$140k',
            'description':
                '<p>We are seeking an experienced Backend Engineer to build scalable APIs and microservices. You will work with Node.js, databases, and cloud infrastructure.</p>',
          },
          {
            'id': 1749309,
            'url':
                'https://remotive.com/remote-jobs/marketing/content-marketing-manager-1749309',
            'title': 'Content Marketing Manager',
            'company_name': 'Growth Marketing Co.',
            'company_logo': 'https://remotive.com/job/1749309/logo',
            'category': 'Marketing',
            'tags': [
              'content strategy',
              'seo',
              'copywriting',
              'analytics',
              'social media',
              'email marketing',
            ],
            'job_type': 'full_time',
            'publication_date': '2025-12-28T14:45:00',
            'candidate_required_location': 'Americas',
            'salary': '\$70k - \$100k',
            'description':
                '<p>Lead our content marketing efforts by creating engaging content strategies, managing editorial calendars, and driving organic growth through SEO-optimized content.</p>',
          },
          {
            'id': 1749310,
            'url':
                'https://remotive.com/remote-jobs/product/product-manager-1749310',
            'title': 'Product Manager',
            'company_name': 'InnovateTech',
            'company_logo': 'https://remotive.com/job/1749310/logo',
            'category': 'Product',
            'tags': [
              'product strategy',
              'roadmap planning',
              'user stories',
              'agile',
              'analytics',
              'stakeholder management',
            ],
            'job_type': 'full_time',
            'publication_date': '2025-12-27T11:20:15',
            'candidate_required_location': 'Worldwide',
            'salary': '\$100k - \$150k',
            'description':
                '<p>We are hiring a Product Manager to own the product roadmap and work closely with engineering and design teams. You will define product vision, prioritize features, and ensure successful product launches.</p>',
          },
        ],
      },
    });
  }
}
