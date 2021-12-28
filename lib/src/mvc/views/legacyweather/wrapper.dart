import 'package:asadamatic/src/mvc/views/legacyweather/screens/welcome_screen.dart';
import 'package:asadamatic/src/mvc/views/legacyweather/home_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
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
            return const HomeWrapper();
          } else {
            return WelcomeScreen(
              selectScreen: selectScreen,
            );
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
  return prefs.getBool('wrapperVisitingValue') ?? false;
}

setVisitingValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('wrapperVisitingValue', true);
}
