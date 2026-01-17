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
