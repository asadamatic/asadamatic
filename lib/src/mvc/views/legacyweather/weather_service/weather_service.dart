import 'package:asadamatic/src/mvc/views/legacyweather/data_models/city.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/data_models/weather.dart';
import 'package:get/get.dart';
import 'dart:convert';

class WeatherNetwork extends GetConnect {
  String openWeatherAPI(String cityName) =>
      "https://g77mwi.deta.dev/weather/?city=$cityName";

  Future<Weather> getWeather(City city) async {
    final Response result = await get(openWeatherAPI(city.name!));
    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  Weather parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final Map<String, dynamic> jsonMain = jsonDecoded["main"];
    final Map<String, dynamic> jsonSys = jsonDecoded["sys"];
    final Map<String, dynamic> jsonWeather = jsonDecoded["weather"][0];
    final Map<String, dynamic> newMap = {};

    newMap.addAll(jsonMain);
    newMap.addAll(jsonSys);
    newMap.addAll(jsonWeather);
    newMap.addAll(jsonDecoded);
    return Weather.fromJson(newMap);
  }
}
