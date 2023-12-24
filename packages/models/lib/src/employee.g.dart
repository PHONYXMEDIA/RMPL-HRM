// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      aadharNumber: json['aadharNumber'] as String?,
      address: json['address'] as String?,
      basicSalary: (json['basicSalary'] as num?)?.toDouble(),
      branch: json['branch'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      creator: const DocumentReferenceConverter().fromJson(json['creator']),
      dateJoined:
          const TimestampConverter().fromJson(json['dateJoined'] as Timestamp?),
      designation: json['designation'] as String?,
      salaryDetails: (json['salaryDetails'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(k, SalaryDetail.fromJson(e as Map<String, dynamic>)),
            )),
      ),
      dob: const TimestampConverter().fromJson(json['dob'] as Timestamp?),
      eid: json['eid'] as String?,
      email: json['email'] as String?,
      fathersName: json['fathersName'] as String?,
      fieldWorkAllowance: json['fieldWorkAllowance'] as String?,
      firstName: json['firstName'] as String?,
      hra: (json['hra'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      lastName: json['lastName'] as String?,
      panNumber: json['panNumber'] as String?,
      password: json['password'] as String?,
      probation: json['probation'] as bool?,
      probationTill: const TimestampConverter()
          .fromJson(json['probationTill'] as Timestamp?),
      profilePic: json['profilePic'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'aadharNumber': instance.aadharNumber,
      'address': instance.address,
      'basicSalary': instance.basicSalary,
      'branch': instance.branch,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'creator': const DocumentReferenceConverter().toJson(instance.creator),
      'dateJoined': const TimestampConverter().toJson(instance.dateJoined),
      'designation': instance.designation,
      'salaryDetails': instance.salaryDetails,
      'dob': const TimestampConverter().toJson(instance.dob),
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
      'probation': instance.probation,
      'probationTill':
          const TimestampConverter().toJson(instance.probationTill),
      'profilePic': instance.profilePic,
      'uid': instance.uid,
    };

_$SalaryDetailImpl _$$SalaryDetailImplFromJson(Map<String, dynamic> json) =>
    _$SalaryDetailImpl(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SalaryDetailImplToJson(_$SalaryDetailImpl instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'amount': instance.amount,
    };
