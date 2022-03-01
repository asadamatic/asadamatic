import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/message_sender.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Stack(
      children: [
        GetBuilder<ChatController>(
            id: 'updateMessages',
            builder: (_chatController) => ListView.builder(
                // reverse: true,
                itemCount: _chatController.chatMessages.length,
                itemBuilder: (context, index) {
                  final received =
                      _chatController.chatMessages[index].receiverEmail ==
                          _chatController.session!.email;

                  return Align(
                    alignment:
                        received ? Alignment.centerLeft : Alignment.centerRight,
                    child: MessageWidget(
                      chatMessage: _chatController.chatMessages[index],
                      received: received,
                    ),
                  );
                })),
        Align(
          alignment: Alignment.bottomCenter,
          child: MessageSender(),
        )
      ],
    );
  }
}
