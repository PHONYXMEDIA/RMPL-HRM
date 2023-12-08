import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converters/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_detail.freezed.dart';
part 'salary_detail.g.dart';

@freezed
class SalaryDetail with _$SalaryDetail {
  @TimestampConverter()
  @DocumentReferenceConverter()
  const factory SalaryDetail({
    double? amount,
    DateTime? bonus,
    DateTime? createdAt,
  }) = _SalaryDetail;

  factory SalaryDetail.fromJson(Map<String, dynamic> json) =>
      _$SalaryDetailFromJson(json);
}
