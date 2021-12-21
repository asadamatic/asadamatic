import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:legacyweather/constants/values.dart';
import 'package:legacyweather/controllers/weather_controller.dart';
import 'package:legacyweather/screens/location_selector.dart';
import 'package:legacyweather/widgets/weather_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _weatherController = Get.find();
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
            preferredSize: Size.fromHeight(100.0),
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
                            builder: (context) => LocationSelector()));
                      },
                      icon: Icon(Icons.add),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          body: WeatherUpdates()),
    );
  }
}

class WeatherUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(builder: (_weatherController) {
      return _weatherController.weatherData.isEmpty
          ? Center(
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
                    ? Center(child: CircularProgressIndicator())
                    : WeatherDisplay(
                        weather: _weatherController.weatherData[index],
                        city: _weatherController.cities[index]);
              });
    });
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          image: AssetImage('Assets/upsetcloud.png', package: 'legacyweather'),
          height: 170.0,
        ),
        SizedBox(
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
