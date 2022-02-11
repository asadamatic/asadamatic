import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
      Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: _chatController.logout,
          icon: Icon(Icons.settings),
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Chat Screen"),
            Text("Chat feature is under development!"),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
