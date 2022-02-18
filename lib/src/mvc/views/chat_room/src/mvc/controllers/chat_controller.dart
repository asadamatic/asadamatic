import 'dart:async';

import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/models/session.dart';
import 'package:asadamatic/src/mvc/models/user.dart';
import 'package:asadamatic/src/mvc/models/verification_code.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/chat_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/reset_pin_screen.dart';
import 'package:asadamatic/src/services/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  bool? sessionIdLoaded = false;
  String? sessionId = '';
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final GlobalKey<FormState> welcomeFormKey = GlobalKey<FormState>();
  bool? isLoading = false;
  int? welcomePageIndex = 0;
  final PageController welcomePageController = PageController();
  final PageController intermediatePageController = PageController();
  final PageController resetPinPageController = PageController();
  final NetworkService _networkService = NetworkService();
  DateTime? codeExpirationTime;
  Duration? timeLeft;
  RxString? timeDisplay = ''.obs;
  bool? userExists = false;
  VerificationCode? verificationCode;
  int? pin;
  Session? session;

  @override
  void onInit() async {
    super.onInit();
    sessionId = await getSessionId();
    if (sessionId!.isNotEmpty) {
      final response = await _networkService.loadSession(sessionId);
      if (response.statusCode == 200) {
        session = Session.fromJson(response.body);
      } else {
        sessionId = "";
      }
    }

    sessionIdLoaded = true;
    update(['updateChatWrapper']);
  }

  // Email functions
  String? emailValidator(String? email) {
    return emailRegExp.hasMatch(email!) ? null : 'Invalid email address';
  }

  onEmailChanged(String? email) {
    if (emailRegExp.hasMatch(email!)) {
      welcomeFormKey.currentState!.validate();
    }
  }

  // Name functions
  String? nameValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  onNameChanged(String? name) {
    if (name!.isNotEmpty) {
      welcomeFormKey.currentState!.validate();
    }
  }

  // Pin code functions
  String? pinValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  // Verification code functions
  String? verificationCodeValidator(String? name) {
    return name!.isNotEmpty ? null : 'Provide a name';
  }

  processVisitorData(BuildContext context) async {
    if (welcomeFormKey.currentState!.validate()) {
      isLoading = true;
      update(['updateLoadingWidget']);
      final response = await _networkService
          .sendEmailForVerification(emailEditingController.text.trim());
      if (response.statusCode == 201) {
        verificationCode = VerificationCode.baseFromJson(response.body);

        timeLeft = verificationCode!.expireTime!
            .difference(verificationCode!.genTime!);
        Timer.periodic(const Duration(seconds: 1), (timer) {
          if (timeLeft == Duration.zero) {
            getTime();
            update(['updateResendButton']);
            timer.cancel();
          }
          getTime();
        });
        switchToNextPageOnAnyScreen();
      } else if (response.statusCode == 200) {
        userExists = true;
        update(['changeVerificationScreen']);
        switchToNextPageOnAnyScreen();
      }
      isLoading = false;
      update(['updateLoadingWidget']);
    }
  }

  verifyCode() async {
    if (welcomeFormKey.currentState!.validate()) {
      isLoading = true;
      update(['updateLoadingWidget']);
      final response = await _networkService.verifyCode(VerificationCode(
          index: verificationCode!.index,
          email: verificationCode!.email,
          genTime: verificationCode!.genTime,
          expireTime: verificationCode!.expireTime,
          code: verificationCode!.code,
          usedTime: DateTime.now()));
      if (response.statusCode == 202) {
        switchToNextPageOnAnyScreen();
      } else if (response.statusCode == 204) {
      } else if (response.statusCode == 406) {
      } else if (response.statusCode == 404) {}
      isLoading = false;

      update(['updateLoadingWidget']);
    }
  }

  verifyPin(BuildContext context) async {
    if (welcomeFormKey.currentState!.validate()) {
      isLoading = true;
      update(['updateLoadingWidget']);
      final response = await _networkService.verifyPin(
          User(
              email: emailEditingController.text.isEmpty
                  ? session?.email
                  : emailEditingController.text,
              pin: pin),
          sessionId: session?.sessionId ?? '');

      if (response.statusCode == 200) {
        if (session == null) {
          session = Session.fromJson(response.body);
          setSessionId(session!.sessionId!);
          sessionId = session!.sessionId!;
        } else {
          session!.isActive = true;
        }

        update(['updateChatWrapper']);
      } else if (response.statusCode == 404) {}
      isLoading = false;

      update(['updateLoadingWidget']);
    }
  }

  updateUserData(BuildContext context) async {
    if (welcomeFormKey.currentState!.validate()) {
      isLoading = true;
      update(['updateLoadingWidget']);

      final response = await _networkService.updateData(
          User(
              email: verificationCode!.email,
              name: nameEditingController.text,
              pin: pin),
          sessionId: session?.sessionId ?? '');
      if (response.statusCode == 200) {
        session = Session.fromJson(response.body);
        setSessionId(session!.sessionId!);
        update(['updateChatWrapper']);
      } else {}
      isLoading = false;

      update(['updateLoadingWidget']);
    }
  }

  resetPin() {}
  getTime() {
    timeDisplay!.value =
        (timeLeft!.inSeconds / 60).toString()[0].padLeft(2, '0') +
            ' : ' +
            (timeLeft!.inSeconds % 60).toString().padLeft(2, '0');
    if (timeLeft! > Duration.zero) {
      timeLeft = timeLeft! - const Duration(seconds: 1);
    }
  }

  onWelcomePageChange(int? index) {
    welcomePageIndex = index;
    update(['updatePageIndexDisplay']);
  }

  switchToNextPageOnAnyScreen() {
    if (welcomeFormKey.currentState!.validate()) {
      welcomePageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  switchToNextPageOnResetPinScreen() {
    if (welcomeFormKey.currentState!.validate()) {
      resetPinPageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    }
  }

  openChatScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
  }

  openResetPinScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ResetPinScreen()));
  }

  differentEmail() async {
    final response = await _networkService.removeOldSession(sessionId);
    if (response.statusCode == 200) {
      sessionId = "";
      session = null;

      update(['updateChatWrapper']);
    }
  }

  logout() async {
    isLoading = true;
    update(['updateLoadingWidget']);
    final response =
        await _networkService.logoutFromSession(session!.sessionId);

    if (response.statusCode == 200) {
      session!.isActive = false;
      update(['updateChatWrapper']);
    } else {}
    isLoading = false;

    update(['updateLoadingWidget']);
  }

  Future<String> getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('sessionId') ?? '';
  }

  setSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('sessionId', sessionId);
  }
}
