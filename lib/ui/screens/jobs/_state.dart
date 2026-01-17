part of 'jobs.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  _FiltersType _filtersType = _FiltersType.all;
  _FiltersType get getFiltersType => _filtersType;

  void setFiltersType(_FiltersType value) {
    _filtersType = value;
    notifyListeners();
  }
}

enum _FiltersType {
  all,
  fullTime,
  partTime,
  freelance,
  contract,
  internship,
  remote,
  onSite,
  hybrid,
}
