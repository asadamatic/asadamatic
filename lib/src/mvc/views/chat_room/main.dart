import 'package:asadamatic/main.dart';
import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);

  final ChatController _chatController = Get.put(ChatController());
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: MaterialApp(
        key: GlobalKey(),
          themeMode: _themeController.themeMode!,
          darkTheme: ThemeData(brightness: Brightness.dark),
          debugShowCheckedModeBanner: false,
          home: const Wrapper()),
    );
  }
}
