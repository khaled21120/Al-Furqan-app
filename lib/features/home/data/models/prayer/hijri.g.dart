// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hijri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Date _$DateFromJson(Map<String, dynamic> json) => Date(
  readable: json['readable'] as String?,
  timestamp: json['timestamp'] as String?,
  hijri: json['hijri'] == null ? null : Hijri.fromJson(json['hijri']),
);

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
  date: json['date'] as String?,
  format: json['format'] as String?,
  day: json['day'] as String?,
  weekday: json['weekday'] == null ? null : Weekday.fromJson(json['weekday']),
  month: json['month'] == null ? null : Month.fromJson(json['month']),
  year: json['year'] as String?,
  holidays:
      (json['holidays'] as List<dynamic>?)?.map((e) => e as String).toList(),
  adjustedHolidays:
      (json['adjustedHolidays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  method: json['method'] as String?,
);

Weekday _$WeekdayFromJson(Map<String, dynamic> json) =>
    Weekday(en: json['en'] as String?, ar: json['ar'] as String?);

Month _$MonthFromJson(Map<String, dynamic> json) => Month(
  number: (json['number'] as num?)?.toInt(),
  en: json['en'] as String?,
  ar: json['ar'] as String?,
  days: (json['days'] as num?)?.toInt(),
);
