import 'package:json_annotation/json_annotation.dart';

part 'hijri.g.dart';

@JsonSerializable(createToJson: false)
class Date {
  final String? readable;
  final String? timestamp;
  final Hijri? hijri;

  const Date({this.readable, this.timestamp, this.hijri});

  factory Date.fromJson(json) => _$DateFromJson(json);
}

@JsonSerializable(createToJson: false)
class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  List<String>? holidays;
  List<String>? adjustedHolidays;
  String? method;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromJson(json) => _$HijriFromJson(json);
}

@JsonSerializable(createToJson: false)
class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(json) => _$WeekdayFromJson(json);
}

@JsonSerializable(createToJson: false)
class Month {
  int? number;
  String? en;
  String? ar;
  int? days;

  Month({this.number, this.en, this.ar, this.days});

  factory Month.fromJson(json) => _$MonthFromJson(json);
}
