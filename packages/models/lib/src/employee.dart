import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converters/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  @TimestampConverter()
  @DocumentReferenceConverter()
  const factory Employee({
    String? aadharNumber,
    String? address,
    double? basicSalary,
    String? branch,
    DateTime? createdAt,
    DocumentReference? creator,
    DateTime? dateJoined,
    String? designation,
    DateTime? dob,
    String? eid,
    String? email,
    String? fathersName,
    String? fieldWorkAllowance,
    String? firstName,
    double? hra,
    bool? isActive,
    String? lastName,
    String? panNumber,
    String? password,
    bool? probation,
    DateTime? probationTill,
    String? profilePic,
    String? uid,
  }) = _Employee;

  const Employee._();

  factory Employee.empty() => const Employee();

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
