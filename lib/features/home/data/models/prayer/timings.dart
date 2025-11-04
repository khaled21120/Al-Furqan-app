import 'package:json_annotation/json_annotation.dart';

part 'timings.g.dart';

@JsonSerializable(createToJson: false)
class Timings {
  @JsonKey(name: 'Fajr')
  final String? fajr;
  @JsonKey(name: 'Dhuhr')
  final String? dhuhr;
  @JsonKey(name: 'Asr')
  final String? asr;
  @JsonKey(name: 'Maghrib')
  final String? maghrib;
  @JsonKey(name: 'Isha')
  final String? isha;
  @JsonKey(name: 'Sunrise')
  final String? sunrise;
  @JsonKey(name: 'Sunset')
  final String? sunset;
  @JsonKey(name: 'Imsak')
  final String? imsak;
  @JsonKey(name: 'Firstthird')
  final String? firstthird;
  @JsonKey(name: 'Lastthird')
  final String? lastthird;
  @JsonKey(name: 'Midnight')
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
