import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rmpl_hrm/features/navigation/models/navigation_screen.dart';

part 'navigation.g.dart';

@riverpod
class Navigation extends _$Navigation {
  @override
  NavigationScreen build() => const NavigationScreen();

  void onChange(Screen screen) => state = state.copyWith(screen: screen);
}
