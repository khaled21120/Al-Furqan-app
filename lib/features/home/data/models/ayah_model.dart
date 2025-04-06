import 'package:equatable/equatable.dart';

class AyahModel extends Equatable {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  const AyahModel({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) => AyahModel(
    number: json['number'] as int?,
    text: json['text'] as String?,
    numberInSurah: json['numberInSurah'] as int?,
    juz: json['juz'] as int?,
    manzil: json['manzil'] as int?,
    page: json['page'] as int?,
    ruku: json['ruku'] as int?,
    hizbQuarter: json['hizbQuarter'] as int?,
    sajda: json['sajda'] is bool ? json['sajda'] : false,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'text': text,
    'numberInSurah': numberInSurah,
    'juz': juz,
    'manzil': manzil,
    'page': page,
    'ruku': ruku,
    'hizbQuarter': hizbQuarter,
    'sajda': sajda,
  };

  @override
  List<Object?> get props {
    return [
      number,
      text,
      numberInSurah,
      juz,
      manzil,
      page,
      ruku,
      hizbQuarter,
      sajda,
    ];
  }
}
