import 'package:json_annotation/json_annotation.dart';

part 'hadeeth_details_model.g.dart';

@JsonSerializable(createToJson: false)
class HadeethDetailsModel {
  final String? id;
  final String? title;
  final String? hadeeth;
  final String? attribution;
  final String? grade;
  final String? explanation;
  final List<String>? hints;
  final List<String>? categories;
  final List<String>? translations;
  @JsonKey(name: 'hadeeth_intro')
  final String? hadeethIntro;
  @JsonKey(name: 'words_meanings')
  final List<Map<String, String>>? wordsMeanings;
  final String? reference;

  const HadeethDetailsModel({
    this.id,
    this.title,
    this.hadeeth,
    this.attribution,
    this.grade,
    this.explanation,
    this.hints,
    this.categories,
    this.translations,
    this.hadeethIntro,
    this.wordsMeanings,
    this.reference,
  });

  factory HadeethDetailsModel.fromJson(json) =>
      _$HadeethDetailsModelFromJson(json);
}
