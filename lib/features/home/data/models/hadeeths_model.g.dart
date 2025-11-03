// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadeeths_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadeethsModel _$HadeethsModelFromJson(Map<String, dynamic> json) =>
    HadeethsModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      translations:
          (json['translations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );
