import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class AppConstants {
  static const String appTitle = 'Asad Hameed - Flutter Developer';

  static RegExp get emailRegExp => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static const List<String> descriptions = [
    "Bolt Grocery lets you create grocery lists, so you never forget an item! ",
    'Productivity Simplified with daily todo app!',
    'Keep up to date with weather conditions with Weather by Legacy'
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
}
