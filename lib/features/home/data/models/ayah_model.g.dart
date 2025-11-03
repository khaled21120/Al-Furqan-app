// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => AyahModel(
  number: (json['number'] as num?)?.toInt(),
  name: json['name'] as String?,
  englishName: json['englishName'] as String?,
  englishNameTranslation: json['englishNameTranslation'] as String?,
  revelationType: json['revelationType'] as String?,
  numberOfAyahs: (json['numberOfAyahs'] as num?)?.toInt(),
  ayahs: (json['ayahs'] as List<dynamic>?)?.map(Ayah.fromJson).toList(),
);

Ayah _$AyahFromJson(Map<String, dynamic> json) => Ayah(
  number: (json['number'] as num?)?.toInt(),
  text: json['text'] as String?,
  numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
  juz: (json['juz'] as num?)?.toInt(),
  manzil: (json['manzil'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  ruku: (json['ruku'] as num?)?.toInt(),
  hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
);
