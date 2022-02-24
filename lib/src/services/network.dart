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
  final packagesData = 'packages/';

  Future<Response> getPackagesData() async {
    final response = await get(url + packagesData);

    return response;
  }
}
