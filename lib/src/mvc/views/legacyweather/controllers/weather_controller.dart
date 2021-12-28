import 'package:asadamatic/src/mvc/views/legacyweather/data_models/city.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/data_models/weather.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/weather_service/weather_service.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  List<Weather> weatherData = [];
  List<City> cities = [];
  bool isLoading = false;

  final WeatherNetwork _weatherNetwork = WeatherNetwork();


  addCity(City city) async {
    cities.add(city);
    weatherData.add(await _weatherNetwork.getWeather(city));
    update();
  }

  removeCity(City city) async {
    cities.remove(city);
    weatherData.removeWhere((weather) => weather.id == city.id);
    update();
  }
}
