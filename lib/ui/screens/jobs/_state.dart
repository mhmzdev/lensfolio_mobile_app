part of 'jobs.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  _FiltersType? _filtersType;
  _FiltersType? get getFiltersType => _filtersType;

  void setFiltersType(_FiltersType? value) {
    if (value == _filtersType) {
      _filtersType = null;
    } else {
      _filtersType = value;
    }
    notifyListeners();
  }

  void onGenerateCoverLetter(BuildContext context, Job job) {
    try {
      final cubit = UserCubit.c(context);
      final user = cubit.state.userData!;

      final tools = user.techStack.map((t) => t.technologies);
      final flatTools = tools.expand((t) => t).toList();

      final payload = {
        'company_name': job.companyName,
        'position': job.title,
        'job_description': HtmlParser.parse(
          job.description ?? 'No description available',
        ),
        'candidate_name': user.fullName,
        'candidate_location': user.cityState,
        if (user.preferredRoles.isAvailable)
          'target_seniority': user.preferredRoles,
        if (user.skills.isAvailable) 'skills': user.skills,
        'tools': flatTools,
        'portfolio_url': user.website,
        'tone': 'warm',
        'length': 'standard',
        if (user.education.isAvailable) 'education': user.education,
        if (user.experience.isAvailable) 'experience': user.experience,
      };

      CoverLetterCubit.c(context).generate(payload);
    } catch (e) {
      UIFlash.error(
        context,
        'Something went wrong in while generating the cover letter!',
      );
    }
  }
}

enum _FiltersType {
  softwareDevelopment(slug: 'software-development'),
  customerService(slug: 'customer-service'),
  design(slug: 'design'),
  marketing(slug: 'marketing'),
  salesBusiness(slug: 'sales-business'),
  product(slug: 'product'),
  projectManagement(slug: 'project-management'),
  aiMl(slug: 'ai-ml'),
  dataAnalysis(slug: 'data-analysis'),
  devopsSysadmin(slug: 'devops-sysadmin'),
  finance(slug: 'finance'),
  humanResources(slug: 'human-resources'),
  qa(slug: 'qa'),
  writing(slug: 'writing'),
  legal(slug: 'legal'),
  medical(slug: 'medical'),
  education(slug: 'education'),
  allOthers(slug: 'all-others')
  ;

  const _FiltersType({required this.slug});
  final String slug;
}
