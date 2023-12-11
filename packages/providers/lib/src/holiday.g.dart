// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$holidaysHash() => r'd5bdccb39d562406425cde5045a36a0552c69632';

/// See also [holidays].
@ProviderFor(holidays)
final holidaysProvider = AutoDisposeStreamProvider<Iterable<Holiday>>.internal(
  holidays,
  name: r'holidaysProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$holidaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HolidaysRef = AutoDisposeStreamProviderRef<Iterable<Holiday>>;
String _$countHolidaysHash() => r'254455e10379323f95c3f6f77b06b378b12981be';

/// See also [CountHolidays].
@ProviderFor(CountHolidays)
final countHolidaysProvider =
    AutoDisposeNotifierProvider<CountHolidays, int>.internal(
  CountHolidays.new,
  name: r'countHolidaysProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$countHolidaysHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CountHolidays = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
