import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_date.g.dart';

@riverpod
DateTime currentDate(CurrentDateRef _) => DateTime.now();
