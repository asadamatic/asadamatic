import 'package:asadamatic/src/constant/secrets.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class NetworkService extends GetConnect {
  final url = kDebugMode
      ? GetPlatform.isAndroid
          ? localHostUrlAndroid
          : localHostUrl
      : remoteHostUrl;
  final packageData = 'packages/';

  Future<Package> getPackageData(String package) async {
    final response = await get(url + packageData + package);
    return Package.fromJson(response.body);
  }
}
