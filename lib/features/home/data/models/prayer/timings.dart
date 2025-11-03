import 'package:json_annotation/json_annotation.dart';

part 'timings.g.dart';

@JsonSerializable(createToJson: false)
class Timings {
  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final String? sunrise;
  final String? sunset;
  final String? imsak;
  final String? firstthird;
  final String? lastthird;
  final String? midnight;

  const Timings({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.sunrise,
    this.sunset,
    this.imsak,
    this.firstthird,
    this.lastthird,
    this.midnight,
  });

  factory Timings.fromJson(json) => _$TimingsFromJson(json);
}
