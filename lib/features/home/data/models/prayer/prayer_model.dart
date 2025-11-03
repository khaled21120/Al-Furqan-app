import 'package:json_annotation/json_annotation.dart';
import 'timings.dart';

import 'hijri.dart';

part 'prayer_model.g.dart';

@JsonSerializable(createToJson: false)
class PrayerModel {
  final Date? date;
  final Timings? timings;

  const PrayerModel({this.date, this.timings});

  factory PrayerModel.fromJson(json) => _$PrayerModelFromJson(json);
}
