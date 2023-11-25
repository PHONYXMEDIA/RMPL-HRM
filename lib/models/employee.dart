import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rmpl_hrm/models/leave.dart';

part 'employee.g.dart';

@JsonSerializable()
@TimestampConverter()
@DocumentReferenceJsonConverter()
class Employee extends Equatable {
  const Employee({
    this.creator,
    this.aadharNumber,
    this.address,
    this.basicSalary,
    this.branch,
    this.dateJoined,
    this.designation,
    this.dob,
    this.eid,
    this.email,
    this.fathersName,
    this.fieldWorkAllowance,
    this.firstName,
    this.hra,
    this.isActive,
    this.lastName,
    this.panNumber,
    this.password,
    this.profileUrl,
    this.uid,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  List<Object?> get props => [
        aadharNumber,
        address,
        basicSalary,
        branch,
        dateJoined,
        designation,
        dob,
        eid,
        email,
        fathersName,
        fieldWorkAllowance,
        firstName,
        creator,
      ];

  final String? aadharNumber;
  final String? address;
  final double? basicSalary;
  final String? branch;
  final DateTime? dateJoined;
  final String? designation;
  final DateTime? dob;
  final String? eid;
  final String? email;
  final String? fathersName;
  final String? fieldWorkAllowance;
  final String? firstName;
  final String? hra;
  final bool? isActive;
  final String? lastName;
  final String? panNumber;
  final String? password;
  final String? profileUrl;
  final String? uid;
  final DocumentReference? creator;
}
