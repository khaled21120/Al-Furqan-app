import 'package:json_annotation/json_annotation.dart';


part 'hadeeths_categories_model.g.dart';


@JsonSerializable(createToJson: false)
class HadeethsCategoriesModel {
  final String? id;
  final String? title;
  @JsonKey(name: 'hadeeths_count')
  final String? hadeethsCount;
  @JsonKey(name: 'parent_id')
  final dynamic parentId;

  const HadeethsCategoriesModel({
    this.id,
    this.title,
    this.hadeethsCount,
    this.parentId,
  });

  factory HadeethsCategoriesModel.fromJson(json) =>
      _$HadeethsCategoriesModelFromJson(json);
}
