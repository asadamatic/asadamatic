import 'dart:convert';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/package.dart';
import 'package:asadamatic/src/mvc/models/session.dart';
import 'package:asadamatic/src/mvc/models/user.dart';
import 'package:asadamatic/src/mvc/models/verification_code.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class NetworkService extends GetConnect {
  final url = kDebugMode ? GetPlatform.isAndroid ? localHostUrlAndroid : localHostUrl : remoteHostUrl;
  final packageData = 'packages/';
  final emailVerification = 'verify-email';
  final codeVerification = 'verify-code';
  final settingPin = 'set-pin';
  final verificationPin = 'verify-pin';
  final session = 'session/';
  Future<Package> getPackageData(String package) async {
    final response = await get(url + packageData + package);
    return Package.fromJson(response.body);
  }

  Future<Response> sendEmailForVerification(String? email) async {
    final response =
        await post(url + emailVerification, jsonEncode({'email': email!}));

    return response;
  }

  Future<Response> verifyCode(VerificationCode? verificationCode) async {
    final deviceName = await getDeviceName();
    final response = await post(
        url + codeVerification,
        jsonEncode(
            {'code': verificationCode!.toJson(), 'device_name': deviceName}));
    return response;
  }

  Future<Response> verifyPin(User? user) async {

    final deviceName = await getDeviceName();
    print( jsonEncode({'user': {'email': user!.email, 'pin': user.pin}, 'device_name': deviceName}));
    final response = await post(url + verificationPin,
        jsonEncode({'user': {'email': user.email, 'pin': user.pin}, 'device_name': deviceName}));
    return response;
  }

  Future<Response> updateUser(User? user) async {
    final response = await post(url + settingPin, jsonEncode(user!.toJson()));
    return response;
  }

  Future<Response> loadSession(String? sessionId) async {
    final response = await get(url + session + '?session_id=$sessionId');

    return response;
  }
}
