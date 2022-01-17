import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);

  final ChatController _chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
