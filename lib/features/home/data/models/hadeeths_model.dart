import 'package:equatable/equatable.dart';

class HadeethsModel extends Equatable {
  final String? id;
  final String? title;
  final List<dynamic>? translations;

  const HadeethsModel({this.id, this.title, this.translations});

  factory HadeethsModel.fromJson(Map<String, dynamic> json) => HadeethsModel(
    id: json['id'] as String?,
    title: json['title'] as String?,
    translations: json['translations'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'translations': translations,
  };

  @override
  List<Object?> get props => [id, title, translations];
}
