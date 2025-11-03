// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genaric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseResponse<T>(
  code: (json['code'] as num?)?.toInt(),
  status: json['status'] as String?,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
  result: _$nullableGenericFromJson(json['result'], fromJsonT),
);

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);
