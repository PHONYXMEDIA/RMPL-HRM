import 'package:intl/intl.dart';

extension FormattedDate on DateTime? {
  String get formattedDate {
    if (this == null) return '';
    return DateFormat('EEE, d MMM').format(this!);
  }
}
