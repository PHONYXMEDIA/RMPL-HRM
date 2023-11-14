import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee extends Equatable {
  const Employee({
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
      ];

  final String? aadharNumber;
  final String? address;
  final String? basicSalary;
  final String? branch;
  final String? dateJoined;
  final String? designation;
  final String? dob;
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
}
