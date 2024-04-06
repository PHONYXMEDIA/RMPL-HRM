// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workingDayCountHash() => r'2cebea2633a5923cdc562a7adf5f38a3abb5415c';

/// See also [workingDayCount].
@ProviderFor(workingDayCount)
final workingDayCountProvider = AutoDisposeProvider<int>.internal(
  workingDayCount,
  name: r'workingDayCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$workingDayCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorkingDayCountRef = AutoDisposeProviderRef<int>;
String _$absenceCountHash() => r'3a3d7589690a6d08d6cd7f3ca8fa0c77095d53dd';

/// See also [absenceCount].
@ProviderFor(absenceCount)
final absenceCountProvider = AutoDisposeProvider<int>.internal(
  absenceCount,
  name: r'absenceCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$absenceCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AbsenceCountRef = AutoDisposeProviderRef<int>;
String _$attendanceHash() => r'01d951f0ed918226033c4a38e0c0e98c0ecd4f49';

/// See also [Attendance].
@ProviderFor(Attendance)
final attendanceProvider =
    AutoDisposeNotifierProvider<Attendance, a.AttendanceState>.internal(
  Attendance.new,
  name: r'attendanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$attendanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Attendance = AutoDisposeNotifier<a.AttendanceState>;
String _$attendanceCountHash() => r'31b54707a1613a06f93d2f96ace08dfa36dcb54c';

/// See also [AttendanceCount].
@ProviderFor(AttendanceCount)
final attendanceCountProvider =
    AutoDisposeNotifierProvider<AttendanceCount, int>.internal(
  AttendanceCount.new,
  name: r'attendanceCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$attendanceCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AttendanceCount = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
