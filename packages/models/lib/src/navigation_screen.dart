import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_screen.freezed.dart';

enum Screen {
  dashboard(title: 'Dashboard'),
  notifications(title: 'Notifications'),
  myAttendance(title: 'My Attendance'),
  holidays(title: 'Holidays'),
  manageLeave(title: 'Manage Leave'),
  salaryDetails(title: 'Salary Details'),
  myProfile(title: 'My Profile');

  const Screen({
    required this.title,
  });

  final String title;
}

@freezed
class NavigationScreen with _$NavigationScreen {
  const factory NavigationScreen({
    @Default(Screen.dashboard) Screen screen,
  }) = _NavigationScreen;
}
