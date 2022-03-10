import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import 'package:flutter/foundation.dart';
class AppConstants {
  static const String appTitle = 'Asad Hameed - Flutter Developer';

  static RegExp get emailRegExp => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  // Scores
  static const int stackoverflowScore = 1363;
  static int get oneBySixtyOfScore => (stackoverflowScore/60).round();

  static const int githubRepoCount = 56;
  static int get oneBySixtyOfCount => (stackoverflowScore/60).round();


  static const int commercialProjects = 2;


  static const List<List<String>> descriptions = [
    ["Grocery", "An app that lets You create grocery lists, so You never forget an item! "],
    ['Todo','Productivity Simplified with daily todo app!'],
    ['Weather', 'Stay up to date with weather conditions with Weather by Legacy']
  ];
  static const List<String> os = ['Android', 'Ios'];
  static const List<List<String>> socialIcons = [
    ['assets/github.png', 'https://github.com/asadamatic'],
    [
      'assets/stack-overflow.png',
      'https://stackoverflow.com/users/10285344/asad-hameed'
    ],
    ['assets/linkedin.png', 'https://www.linkedin.com/in/asadamatic']
  ];
  static const String linkedInUrl =
      'https://stackoverflow.com/users/10285344/asad-hameed';
  static const List<String> appLogoIcons = [
    'assets/boltgrocery/icon.png',
    'assets/dailytodo/icon.png',
    'assets/legacyweather/icon.png'
  ];

  static const List<String> packages = [
    'firestore_search',
    'file_case',
    'dialogs'
  ];

  static const List<Package> packagesDescription = [
    Package(
        name: 'firestore_search',
        description:
            'This package helps developers in implementation of search on Cloud FireStore. This package comes with the implementation of widgets essential  for  performing search on a database.',
        pubPoints: '120',
        popularity: '88',
        likes: '47'),
    Package(
        name: 'file_case',
        description:
            'A flutter widget to showcase and process uploaded files on Web, Android, Ios, MacOs, Linux & Windows.',
        pubPoints: '130',
        popularity: '63',
        likes: '4'),
    Package(
        name: 'dialogs',
        description:
            'This flutter package provides aesthetically designed dialog box with customization options.',
        pubPoints: '110',
        popularity: '80',
        likes: '12'),
  ];
  static const List<String> tools = [
    'Flutter',
    'FastAPI',
    'Python',
    'Java',
    'JavaFx',
    'SQLite',
    'MySQL',
    'Firebase',
    'Android',
    'C++',
    'Selenium',
  ];

  static DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();
  static Future<String?>? getDeviceName() async {
    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model; // e.g. "Moto G (4)"
    } else if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    } // e.g. "iPod7,1"
    else if (GetPlatform.isWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      return webBrowserInfo.platform;

    }
    return 'Device not recognized';
  }

  static const appleType = "apple";
  static const androidType = "android";
  static const desktopType = "desktop";

  static final isWebMobile = kIsWeb && (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android);

  // String getSmartPhoneOrTablet() {
  //   final userAgent = html.window.navigator.userAgent.toString().toLowerCase();
  //   // smartphone
  //   if( userAgent.contains("iphone"))  return appleType;
  //   if( userAgent.contains("android"))  return androidType;
  //
  //   // tablet
  //   if( userAgent.contains("ipad")) return appleType;
  //   if( html.window.navigator.platform.toLowerCase().contains("macintel") && html.window.navigator.maxTouchPoints > 0 ) return appleType;
  //
  //   return desktopType;
  // }
}
