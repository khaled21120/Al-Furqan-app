// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadeeth_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadeethDetailsModel _$HadeethDetailsModelFromJson(
  Map<String, dynamic> json,
) => HadeethDetailsModel(
  id: json['id'] as String?,
  title: json['title'] as String?,
  hadeeth: json['hadeeth'] as String?,
  attribution: json['attribution'] as String?,
  grade: json['grade'] as String?,
  explanation: json['explanation'] as String?,
  hints: (json['hints'] as List<dynamic>?)?.map((e) => e as String).toList(),
  categories:
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList(),
  translations:
      (json['translations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  hadeethIntro: json['hadeeth_intro'] as String?,
  wordsMeanings:
      (json['words_meanings'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
  reference: json['reference'] as String?,
);
