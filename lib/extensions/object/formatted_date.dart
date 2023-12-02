import 'package:intl/intl.dart';

extension FormattedDate on DateTime? {
  String get formattedDate {
    if (this == null) return '';
    return DateFormat('dd MMM yyyy').format(this!);
  }

  String get formattedDateSecondary {
    if (this == null) return '';
    return DateFormat('dd MMMM yyyy').format(this!);
  }

  String get onlyMonthAndYear {
    if (this == null) return '';
    return DateFormat('MMM yyyy').format(this!);
  }

  String get withoutYear {
    if (this == null) return '';
    return DateFormat('dd MMM').format(this!);
  }
}
