import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rmpl_hrm/extensions/object/log.dart';

class AppObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    'Provider $provider was initialized with $value'.log();
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    'Provider $provider was disposed'.log();
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    'Provider $provider updated from $previousValue to $newValue'.log();
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    'Provider $provider threw $error at $stackTrace'.log();
  }
}
