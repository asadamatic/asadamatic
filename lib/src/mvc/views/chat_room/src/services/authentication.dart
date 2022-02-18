

import 'dart:convert';

import 'package:asadamatic/src/constant/secrets.dart';
import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/user.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/verification_code.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Authentication extends GetConnect{

  final url = kDebugMode
      ? GetPlatform.isAndroid
      ? localHostUrlAndroid
      : localHostUrl
      : remoteHostUrl;
  final emailVerification = 'verify-email';
  final codeVerification = 'verify-code';
  final settingPin = 'set-pin';
  final verificationPin = 'verify-pin';
  final session = 'session/';
  final logout = 'logout/';
  final removeSession = 'remove-session/';


  Future<Response> sendEmailForVerification(String? email) async {
    final response =
    await post(url + emailVerification, jsonEncode({'email': email!}));

    return response;
  }

  Future<Response> verifyCode(VerificationCode? verificationCode) async {
    final deviceName = await AppConstants.getDeviceName();
    final response = await post(
        url + codeVerification,
        jsonEncode(
            {'code': verificationCode!.toJson(), 'device_name': deviceName}));
    return response;
  }

  Future<Response> verifyPin(User? user, {String? sessionId}) async {
    final deviceName = await AppConstants.getDeviceName();
    final response = await post(
        url + verificationPin,
        jsonEncode({
          'user': {'email': user!.email, 'pin': user.pin},
          'session_id': sessionId,
          'device_name': deviceName
        }));
    return response;
  }

  Future<Response> updateData(User? user, {String? sessionId}) async {
    final deviceName = await AppConstants.getDeviceName();
    final response = await post(
        url + settingPin,
        jsonEncode({
          'user': user!.toJson(),
          'session_id': sessionId,
          'device_name': deviceName
        }));
    return response;
  }

  Future<Response> loadSession(String? sessionId) async {
    final response = await get(url + session + '?session_id=$sessionId');

    return response;
  }

  Future<Response> logoutFromSession(String? sessionId) async {
    final response = await get(
      url + logout + '?session_id=$sessionId',
    );
    return response;
  }

  Future<Response> removeOldSession(String? sessionId) async {
    final response = await get(
      url + removeSession + '?session_id=$sessionId',
    );
    return response;
  }
}