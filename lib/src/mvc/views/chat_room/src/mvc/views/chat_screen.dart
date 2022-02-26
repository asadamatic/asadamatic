import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/loading_widget.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/mobile_back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Stack(
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
        ],
    );
  }
}
