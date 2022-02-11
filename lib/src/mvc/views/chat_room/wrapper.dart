import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/chat_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/intermidiate_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/main.dart';
import 'package:asadamatic/src/mvc/views/chat_room/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      id: 'updateChatWrapper',
      builder: (_controller) {
        if (_controller.sessionIdLoaded!) {
          if (_controller.sessionId!.isNotEmpty) {
            if (_controller.session!.isActive!) {
              return const ChatScreen();
            }
            return const IntermediateScreen();
          } else {
            return ChatRoomWelcome();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
