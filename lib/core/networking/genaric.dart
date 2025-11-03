import 'package:json_annotation/json_annotation.dart';

part 'genaric.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  final int? code;
  final String? status;
  final T? data;
  final T? result;

  const BaseResponse({this.code, this.status, this.data, this.result});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}
