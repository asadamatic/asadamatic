import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/chat_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/intermidiate_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/welcome_screen.dart';
import 'package:asadamatic/src/widgets/chat_room_actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: chatRoomActionsNew(),
      body: GetBuilder<ChatController>(
        id: 'updateChatWrapper',
        builder: (_controller) {
          _controller.welcomePageIndex = 0;
          if (_controller.sessionIdLoaded!) {
            if (_controller.sessionId!.isNotEmpty) {
              if (_controller.session!.isActive!) {
                return  ChatScreen();
              }
              return const IntermediateScreen();
            } else {
              return const ChatRoomWelcome();
            }
          } else {
            return const Center(
                child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
