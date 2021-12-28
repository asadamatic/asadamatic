
class Weather {
  final double? temp;
  final double? pressure;
  final double? humidity;
  final double? tempMax;
  final double? tempMin;
  final String? icon;
  final String? main;
  final String? description;
  final int? sunset;
  final int? sunrise;
  final String? country;
  final int? timezone;
  final int? id;
  double? get getTemp => temp! - 272.5;
  double? get getMaxTemp => tempMax! - 272.5;
  double? get getMinTemp => tempMin! - 272.5;
  DateTime? get sunsetFromMilliseconds =>
      DateTime.fromMillisecondsSinceEpoch(sunset! * 1000);
  DateTime? get sunriseFromMilliseconds =>
      DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000);
  DateTime? get sunsetTime => sunsetFromMilliseconds!.add(Duration(
      seconds: timezone! - sunsetFromMilliseconds!.timeZoneOffset.inSeconds));
  DateTime? get sunriseTime => sunriseFromMilliseconds!.add(Duration(
      seconds: timezone! - sunriseFromMilliseconds!.timeZoneOffset.inSeconds));
  int? get timeDifference => DateTime.fromMillisecondsSinceEpoch(sunset! * 1000)
      .difference(DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000))
      .inHours;
  int? get currentHours => DateTime.now()
      .difference(DateTime.fromMillisecondsSinceEpoch(sunrise! * 1000))
      .inHours;
  double? get sunPosition => currentHours! / timeDifference!;
  Weather(
      this.temp,
      this.pressure,
      this.humidity,
      this.tempMax,
      this.tempMin,
      this.icon,
      this.main,
      this.description,
      this.sunset,
      this.sunrise,
      this.country,
      this.timezone,
      this.id);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        json["temp"],
        json["pressure"],
        json["humidity"],
        json["temp_max"],
        json["temp_min"],
        json["icon"],
        json["main"],
        json["description"],
        json['sunset'],
        json['sunrise'],
        json['country'],
        json['timezone'],
        json['id']);
  }
}
