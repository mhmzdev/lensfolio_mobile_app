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
  softwareDevelopment,
  customerService,
  design,
  marketing,
  salesBusiness,
  product,
  projectManagement,
  aiMl,
  dataAnalysis,
  devopsSysadmin,
  finance,
  humanResources,
  qa,
  writing,
  legal,
  medical,
  education,
  allOthers,
}
