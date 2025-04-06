import 'package:equatable/equatable.dart';

class SurahModel extends Equatable {
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

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
    number: json['number'] as int?,
    name: json['name'] as String?,
    englishName: json['englishName'] as String?,
    englishNameTranslation: json['englishNameTranslation'] as String?,
    numberOfAyahs: json['numberOfAyahs'] as int?,
    revelationType: json['revelationType'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'numberOfAyahs': numberOfAyahs,
    'revelationType': revelationType,
  };

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      numberOfAyahs,
      revelationType,
    ];
  }
}
