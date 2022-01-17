import 'package:asadamatic/src/constant/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  bool? emailLoaded = false;
  String? email = '';
  String? emailErrorText;
  final TextEditingController emailEditingController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  @override
  void onInit() async {
    super.onInit();
    email = await getVisitingValue();
    emailLoaded = true;
    update(['updateChatWrapper']);
  }

  String? emailValidator(String? email) {
    return emailRegExp.hasMatch(email!) ? null : 'Invalid email address';
  }

  processEmail() {

    if (emailFormKey.currentState!.validate()) {}
  }

  onEmailChanged(String? email) {
    if (emailRegExp.hasMatch(email!)){
      emailFormKey.currentState!.validate();
    }
  }

  Future<String> getVisitingValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('visitorEmail') ?? '';
  }

  setVisitingValue(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('visitorEmail', email);
  }
}
