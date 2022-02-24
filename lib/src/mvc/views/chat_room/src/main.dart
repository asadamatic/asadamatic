import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: MaterialApp(
          themeMode: _themeController.themeMode!,
          darkTheme: ChatRoomStyles.darkTheme,
          theme: ChatRoomStyles.lightTheme,
          debugShowCheckedModeBanner: false,
          home: const Wrapper()),
    );
  }
}
