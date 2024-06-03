import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Os {
  ios(icon: Icons.apple_outlined),
  android(icon: Icons.android_outlined);

  const Os({required this.icon});
  final IconData icon;
 

  bool get isIOS => this == Os.ios;
}

enum Platforms {
  android(Icons.phone_android_outlined),
  ios(Icons.phone_iphone_outlined),
  web(Icons.web_asset_outlined),
  desktop(Icons.desktop_windows_outlined);

  const Platforms(this.icon);
  final IconData icon;
  String get displayName => name.capitalizeFirst;
}
