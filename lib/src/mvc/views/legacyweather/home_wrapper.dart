import 'package:asadamatic/src/mvc/views/legacyweather/screens/home_screen.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/screens/location_selector.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  void selectScreen() async {
    setState(() {
      setVisitingValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getVisitingValue(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return const HomeScreen();
          } else {
            return LocationSelector(selectScreen: selectScreen);
          }
        } else {
          return const Scaffold();
        }
      },
    );
  }
}

Future<bool> getVisitingValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('homeWrapperVisitingValue') ?? false;
}

setVisitingValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('homeWrapperVisitingValue', true);
}
