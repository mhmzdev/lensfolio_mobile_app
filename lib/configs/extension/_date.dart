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
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(1.days);
    final date = now.today;

    if (date == today) {
      return 'Today';
    } else if (date == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('EEEE').format(this).toUpperCase();
    }
  }

  bool get isToday {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }

  bool isSameDate(DateTime other) {
    return day == other.day && month == other.month && year == other.year;
  }

  DateTime get dateOnly => DateTime(year, month, day);

  String get timeAgoShort {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} secs ago';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    }

    if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }

    if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} months ago';
    }

    return '${(difference.inDays / 365).floor()} years ago';
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
