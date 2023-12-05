import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rmpl_hrm/converters/converters.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const Employee._();

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

  factory Employee.empty() => const Employee();

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
