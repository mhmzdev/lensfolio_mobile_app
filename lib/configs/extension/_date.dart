part of '../configs.dart';

final _date = DateFormat('dd MMM, yyyy');
final _dateTimeWords = DateFormat('MMM. dd, yyyy HH:mmaaa');
final _woutYear = DateFormat('EEEE, MMM dd');
final _onlyTime = DateFormat('h:mm a');
final _dayOnly = DateFormat('EEEE');
final _dateWithDayShort = DateFormat('EEE, dd MMM yyyy');
final _numericDateShortYear = DateFormat('dd-MM-yy');

extension SuperDate on DateTime {
  DateTime get today => DateTime(year, month, day);

  String get greeting {
    final hour = this.hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  DateTime get endOfDay => add(const Duration(days: 1)).subtract(
    Duration(
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond,
      microseconds: microsecond,
    ),
  );

  String get onlyTime => _onlyTime.format(this).toUpperCase();
  String get dayOnly => _dayOnly.format(this).toUpperCase();
  String get dateWithoutYear => _woutYear.format(this).toUpperCase();

  String get date => _date.format(this);

  String get dateTimeWords => _dateTimeWords.format(toLocal());
  String get dateWithDayShort => _dateWithDayShort.format(this);
  String get numericDateShortYear => _numericDateShortYear.format(this);

  String get timeAgo {
    final now = DateTime.now();
    final date = now.today;

    final diff = now.difference(date);

    if (diff.inDays == 0) {
      return 'Today';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays < 30) {
      final weeks = (diff.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else {
      final months = (diff.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }
  }
}

extension SuperAge on DateTime? {
  int get toAge {
    if (this == null) {
      return 0;
    }
    return DateTime.now().year - this!.year;
  }
}
