import 'package:json_annotation/json_annotation.dart';

part 'ayah_model.g.dart';

@JsonSerializable(createToJson: false)
class AyahModel {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final int? numberOfAyahs;
  final List<Ayah>? ayahs;

  const AyahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
  });

  factory AyahModel.fromJson(json) => _$AyahModelFromJson(json);

}

@JsonSerializable(createToJson: false)
class Ayah {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;

  const Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  factory Ayah.fromJson(json) => _$AyahFromJson(json);
}
