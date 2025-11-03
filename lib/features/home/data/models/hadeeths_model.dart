import 'package:json_annotation/json_annotation.dart';

part 'hadeeths_model.g.dart';

@JsonSerializable(createToJson: false)
class HadeethsModel {
  final String? id;
  final String? title;
  final List<String>? translations;

  const HadeethsModel({this.id, this.title, this.translations});

  factory HadeethsModel.fromJson(json) => _$HadeethsModelFromJson(json);
}
