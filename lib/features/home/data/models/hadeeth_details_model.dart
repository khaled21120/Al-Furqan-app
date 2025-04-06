import 'package:equatable/equatable.dart';

class HadeethDetailsModel extends Equatable {
  final String? id;
  final String? title;
  final String? hadeeth;
  final String? attribution;
  final String? grade;
  final String? explanation;
  final List<String>? hints;
  final List<String>? categories;
  final List<String>? translations;
  final String? hadeethIntro;
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

  factory HadeethDetailsModel.fromJson(Map<String, dynamic> json) {
    return HadeethDetailsModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      hadeeth: json['hadeeth'] as String?,
      attribution: json['attribution'] as String?,
      grade: json['grade'] as String?,
      explanation: json['explanation'] as String?,
      hints: (json['hints'] as List<dynamic>?)?.cast<String>(),
      categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
      translations: (json['translations'] as List<dynamic>?)?.cast<String>(),
      hadeethIntro: json['hadeeth_intro'] as String?,
      wordsMeanings:
          (json['words_meanings'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList(),
      reference: json['reference'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'hadeeth': hadeeth,
    'attribution': attribution,
    'grade': grade,
    'explanation': explanation,
    'hints': hints,
    'categories': categories,
    'translations': translations,
    'hadeeth_intro': hadeethIntro,
    'words_meanings': wordsMeanings,
    'reference': reference,
  };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      hadeeth,
      attribution,
      grade,
      explanation,
      hints,
      categories,
      translations,
      hadeethIntro,
      wordsMeanings,
      reference,
    ];
  }
}
