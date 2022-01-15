import 'package:asadamatic/src/mvc/views/legacyweather/constants/values.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/data_models/city.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/data_models/weather.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather? weather;
  final City? city;

  const WeatherDisplay({Key? key, this.weather, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '${city!.name!}, ${weather!.country!}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            DescriptionImage(
              icon: weather!.icon,
              description: weather!.description,
            ),
            TemperatureIndicator(weather: weather),
            Container(
              margin: const EdgeInsets.only(top: 5.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 5.0,
                    backgroundColor: Colors.white24,
                    percent:
                        double.parse((weather!.humidity! / 100).toString()),
                    center: Text(
                      "${weather!.humidity?.round()}%",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    progressColor: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Humidity",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SunTimeWidget(weather: weather),
          ],
        ));
  }
}

class DescriptionImage extends StatelessWidget {
  const DescriptionImage({
    Key? key,
    required this.icon,
    required this.description,
  }) : super(key: key);

  final String? icon;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
          child: Text(
            description!,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Image(
          image: AssetImage(
            'assets/legacyweather/$icon.png',
          ),
        ),
      ],
    );
  }

  String assetLink(description) {
    if (description == "clear sky") {
      return 'Assets/day/clear_sky.png';
    } else if (description == "few clouds") {
      return 'Assets/day/few_clouds.png';
    } else if (description == "scattered clouds" ||
        description!.contains('clouds')) {
      return 'Assets/day/scattered_clouds.png';
    } else if (description == "broken clouds") {
      return 'Assets/day/broken_clouds.png';
    } else if (description == "shower rain" ||
        description!.contains('rain') ||
        description!.contains('drizzle')) {
      return 'Assets/day/shower_rain.png';
    } else if (description == "rain") {
      return 'Assets/day/raining.png';
    } else if (description == "thunderstorm" ||
        description!.contains('thunderstorm')) {
      return 'Assets/day/thunderstorm.png';
    } else if (description == "snow" ||
        description!.contains("snow") ||
        description!.contains("sleet")) {
      return 'Assets/day/snow.png';
    } else if (description == "mist" ||
        description == "haze" ||
        description == "volcanic ash" ||
        description == "tornado" ||
        description == "fog" ||
        description == "squalls" ||
        description!.contains('dust') ||
        description == "smoke") {
      return 'Assets/day/mist.png';
    }
    return "";
  }
}

class SunTimeWidget extends StatelessWidget {
  const SunTimeWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 225.0,
          height: 100.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 100.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 100.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: primaryColor)),
                    )),
              ),
              TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: 0.0,
                    end: 180 * weather!.sunPosition!,
                  ),
                  duration: const Duration(seconds: 3),
                  builder: (buildContext, double animation, widget) {
                    return Transform(
                      transform: Matrix4Transform()
                          .rotateByCenterDegrees(animation, const Size(225, 25))
                          .translate(y: 90)
                          .matrix4,
                      alignment: const FractionalOffset(0, 0),
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    );
                  })
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  timeFormatter.format(weather!.sunriseTime!),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  timeFormatter.format(weather!.sunsetTime!),
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TemperatureIndicator extends StatelessWidget {
  const TemperatureIndicator({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              weather!.getTemp!.round().toString() + "\u00B0C",
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      weather!.getMinTemp!.round().toString() + "\u00B0C",
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      "Min",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        weather!.getMaxTemp!.round().toString() + "\u00B0C",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Max",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
