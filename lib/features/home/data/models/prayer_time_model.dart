class PrayerTimeModel {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;
  String? sunrise;
  String? sunset;
  String? imsak;
  String? firstthird;
  String? lastthird;
  String? midnight;

  PrayerTimeModel({
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fajr': fajr,
      'dhuhr': dhuhr,
      'asr': asr,
      'maghrib': maghrib,
      'isha': isha,
      'sunrise': sunrise,
      'sunset': sunset,
      'imsak': imsak,
      'firstthird': firstthird,
      'lastthird': lastthird,
      'midnight': midnight,
    };
  }

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['Fajr'] as String?,
      dhuhr: json['Dhuhr'] as String?,
      asr: json['Asr'] as String?,
      maghrib: json['Maghrib'] as String?,
      isha: json['Isha'] as String?,
      sunrise: json['Sunrise'] as String?,
      sunset: json['Sunset'] as String?,
      imsak: json['Imsak'] as String?,
      firstthird: json['Firstthird'] as String?,
      lastthird: json['Lastthird'] as String?,
      midnight: json['Midnight'] as String?,
    );
  }
}
