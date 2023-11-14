// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      aadharNumber: json['aadharNumber'] as String?,
      address: json['address'] as String?,
      basicSalary: json['basicSalary'] as String?,
      branch: json['branch'] as String?,
      dateJoined: json['dateJoined'] as String?,
      designation: json['designation'] as String?,
      dob: json['dob'] as String?,
      eid: json['eid'] as String?,
      email: json['email'] as String?,
      fathersName: json['fathersName'] as String?,
      fieldWorkAllowance: json['fieldWorkAllowance'] as String?,
      firstName: json['firstName'] as String?,
      hra: json['hra'] as String?,
      isActive: json['isActive'] as bool?,
      lastName: json['lastName'] as String?,
      panNumber: json['panNumber'] as String?,
      password: json['password'] as String?,
      profileUrl: json['profileUrl'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'aadharNumber': instance.aadharNumber,
      'address': instance.address,
      'basicSalary': instance.basicSalary,
      'branch': instance.branch,
      'dateJoined': instance.dateJoined,
      'designation': instance.designation,
      'dob': instance.dob,
      'eid': instance.eid,
      'email': instance.email,
      'fathersName': instance.fathersName,
      'fieldWorkAllowance': instance.fieldWorkAllowance,
      'firstName': instance.firstName,
      'hra': instance.hra,
      'isActive': instance.isActive,
      'lastName': instance.lastName,
      'panNumber': instance.panNumber,
      'password': instance.password,
      'profileUrl': instance.profileUrl,
      'uid': instance.uid,
    };
