import 'package:asadamatic/src/mvc/views/legacyweather/constants/values.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/controllers/weather_controller.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/screens/location_selector.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/widgets/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: Material(
              color: primaryColor,
              elevation: 2.0,
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                padding: const EdgeInsets.only(bottom: 16.0),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LocationSelector()));
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          body: const WeatherUpdates()),
    );
  }
}

class WeatherUpdates extends StatelessWidget {
  const WeatherUpdates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(builder: (_weatherController) {
      return _weatherController.weatherData.isEmpty
          ? const Center(
              child: Text(
                'Add a location to see weather updates!',
                style: TextStyle(color: Colors.white),
              ),
            )
          : PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _weatherController.cities.length,
              itemBuilder: (context, index) {
                return _weatherController.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : WeatherDisplay(
                        weather: _weatherController.weatherData[index],
                        city: _weatherController.cities[index]);
              });
    });
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Image(
          image: AssetImage('assets/legacyweather/upsetcloud.png'),
          height: 170.0,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Please check your internet connection',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.0, color: Theme.of(context).colorScheme.secondary),
        ),
      ],
    ));
  }
}
