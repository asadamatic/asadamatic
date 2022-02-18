import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);

  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: MaterialApp(
          themeMode: _themeController.themeMode!,
          darkTheme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          home: const Wrapper()),
    );
  }
}
