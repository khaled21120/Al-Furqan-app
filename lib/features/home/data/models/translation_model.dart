import 'package:json_annotation/json_annotation.dart';

part 'translation_model.g.dart';

@JsonSerializable(createToJson: false)
class SurahTranslationModel {
  final String? id;
  final String? sura;
  final String? aya;
  @JsonKey(name: 'arabic_text')
  final String? arabicText;
  final String? translation;
  final dynamic footnotes;

  const SurahTranslationModel({
    this.id,
    this.sura,
    this.aya,
    this.arabicText,
    this.translation,
    this.footnotes,
  });

  factory SurahTranslationModel.fromJson(json) =>
      _$SurahTranslationModelFromJson(json);
}
