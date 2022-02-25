import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/welcome_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/mobile_back_button.dart';
import 'package:asadamatic/src/style/values.dart';
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
          const LoadingWidget(),
          if (AppConstants.isWebMobile)
            MobileBackButton(
              chatController: _chatController,
            ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: IconButton(
                icon: ChatRoomConstants.settingsIcon,
                onPressed: _chatController.logout(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
