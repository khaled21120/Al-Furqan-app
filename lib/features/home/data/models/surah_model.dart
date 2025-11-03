import 'package:json_annotation/json_annotation.dart';

part 'surah_model.g.dart';

@JsonSerializable()
class SurahModel {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  const SurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory SurahModel.fromJson(json) => _$SurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurahModelToJson(this);
}
