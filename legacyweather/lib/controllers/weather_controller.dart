import 'package:get/get.dart';
import 'package:legacyweather/data_models/city.dart';
import 'package:legacyweather/data_models/weather.dart';
import 'package:legacyweather/weather_service/weather_repo.dart';

class WeatherController extends GetxController {
  List<Weather> weatherData = [];
  List<City> cities = [];
  bool isLoading = false;

  WeatherNetwork _weatherNetwork = WeatherNetwork();
  @override
  void onInit() async {
    super.onInit();
  }

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
