import 'package:models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation.g.dart';

@riverpod
class Navigation extends _$Navigation {
  @override
  NavigationScreen build() => const NavigationScreen();

  void onChange(Screen screen) => state = state.copyWith(screen: screen);
}
