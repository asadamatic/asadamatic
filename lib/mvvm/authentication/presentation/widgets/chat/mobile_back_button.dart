import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';

class MobileBackButton extends StatelessWidget {
  MobileBackButton({Key? key, ChatController? chatController})
      : _chatController = chatController!,
        super(key: key);

  final ChatController _chatController;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _chatController.pushPopChatRoom,
        ),
      ),
    );
  }
}
