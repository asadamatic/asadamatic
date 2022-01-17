import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  bool? emailLoaded = false;
  String? email = '';
  final TextEditingController emailEditingController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    email = await getVisitingValue();
    emailLoaded = true;
    update(['updateChatWrapper']);
  }

  String? emailValidator(String? email) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email!)
        ? ''
        : 'Invalid email address';
  }

  processEmail(){

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
