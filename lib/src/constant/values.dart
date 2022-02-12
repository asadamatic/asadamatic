import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String appTitle = 'Asad Hameed - Flutter Developer';

RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

List<String> descriptions = [
  "Bolt Grocery lets you create grocery lists, so you never forget an item! ",
  'Productivity Simplified with daily todo app!',
  'Keep up to date with weather conditions with Weather by Legacy'
];
List<String> os = ['Android', 'Ios'];
List<List<String>> socialIcons = [
  ['assets/github.png', 'https://github.com/asadamatic'],
  [
    'assets/stack-overflow.png',
    'https://stackoverflow.com/users/10285344/asad-hameed'
  ],
  ['assets/linkedin.png', 'https://www.linkedin.com/in/asadamatic']
];
List<String> appLogoIcons = [
  'assets/boltgrocery/icon.png',
  'assets/dailytodo/icon.png',
  'assets/legacyweather/icon.png'
];

List<String> packages = ['firestore_search', 'file_case', 'dialogs'];

Color shimmerBaseColor = Colors.grey[200]!;
Color shimmerHighlightColor = Colors.grey[400]!;

// Color packageNameColor = const Color(0xFF1967d2);

List<String> tools = [
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

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
getDeviceName() async {
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
}


class ChatRoomValues{
  static const double actionSize = 28.0;
  static const double actionIconSize = 24.0;
  static const double chatRoomHeightMax = 657.0;
  static const double chatRoomWidthMax = 360.0;
  static const double chatRoomHeightMin = 400.0;
  static const double chatRoomWidthMin = 360.0;
  static const double chatRoomHeightClosed = 0.0;
  static const double chatRoomWidthClosed = 0.0;
  static const Icon resizeIcon = Icon(Icons.fullscreen, size: actionIconSize,);
  static const Icon closeIcon = Icon(Icons.close, size: actionIconSize,);
  static const List<Icon> chatRoomActions = [resizeIcon, closeIcon];
}
