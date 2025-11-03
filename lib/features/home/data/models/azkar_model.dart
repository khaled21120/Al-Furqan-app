import 'package:json_annotation/json_annotation.dart';

part 'azkar_model.g.dart';

@JsonSerializable(createToJson: false)
class AzkarModel {
  final String? category;
  final String? count;
  final String? description;
  final String? reference;
  final String? content;

  const AzkarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory AzkarModel.fromJson(json) => _$AzkarModelFromJson(json);
}
