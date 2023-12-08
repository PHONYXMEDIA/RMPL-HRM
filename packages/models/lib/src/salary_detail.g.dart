// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalaryDetailImpl _$$SalaryDetailImplFromJson(Map<String, dynamic> json) =>
    _$SalaryDetailImpl(
      amount: (json['amount'] as num?)?.toDouble(),
      bonus: const TimestampConverter().fromJson(json['bonus'] as Timestamp?),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$SalaryDetailImplToJson(_$SalaryDetailImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'bonus': const TimestampConverter().toJson(instance.bonus),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
