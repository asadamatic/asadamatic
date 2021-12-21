import 'package:get/get.dart';
import 'package:legacyweather/constants/api_key.dart';
import 'package:legacyweather/data_models/city.dart';
import 'dart:convert';
import 'package:legacyweather/data_models/weather.dart';

class WeatherNetwork extends GetConnect {
  String openWeatherAPI(String cityName) =>
      "http://127.0.0.1:8000/weather/?city=$cityName";

  Future<Weather> getWeather(City city) async {
    final Response result = await get(openWeatherAPI(city.name!));
    if (result.statusCode != 200) throw Exception();
    print(result.body);
    return parsedJson(result.body);
  }

  Weather parsedJson(final response) {
    print('Decoding json');
    final jsonDecoded = json.decode(response);
    print('Decoded json');
    print(response[0]);
    final Map<String, dynamic> jsonMain = jsonDecoded["main"];
    print('Decoded main');
    final Map<String, dynamic> jsonSys = jsonDecoded["sys"];
    print('Decoded sys');
    final Map<String, dynamic> jsonWeather = jsonDecoded["weather"][0];
    print('Decoded weather');
    final Map<String, dynamic> newMap = {};

    print('Separated json');
    newMap.addAll(jsonMain);
    newMap.addAll(jsonSys);
    newMap.addAll(jsonWeather);
    newMap.addAll(jsonDecoded);
    print('Added to new maps');
    return Weather.fromJson(newMap);
  }
}
