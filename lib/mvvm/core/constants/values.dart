import 'package:asadamatic/mvvm/core/constants/assets.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/package.dart';
import 'package:asadamatic/mvvm/features/home/domain/entity/skill.dart';
import 'package:asadamatic/mvvm/enums.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import 'package:flutter/foundation.dart';

class AppConstants {
  static const String appTitle = 'Asad Hameed - Flutter Developer';

  // Scores




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

  static final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

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
