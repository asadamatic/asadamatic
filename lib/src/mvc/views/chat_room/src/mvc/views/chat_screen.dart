import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/message_sender.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ChatController _chatController = Get.find();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 45.0, top: 20.0, right: 10.0, left: 10.0),
          child: GetBuilder<ChatController>(
              id: 'updateMessages',
              builder: (_chatController) => ListView.builder(
                reverse: true,
                  controller: _chatController.messageScrollController,
                  itemCount: _chatController.chatMessages.length,
                  itemBuilder: (context, index) {

                    final received = _chatController
                            .chatMessages[index].receiverEmail ==
                        _chatController.session!.email;

                    final receivedBackgroundColor = _themeController
                        .isThemeDark
                        ? ChatRoomStyles.receivedMessageBackgroundColorDark
                        : ChatRoomStyles.receivedMessageBackgroundColor;

                    // White text color in light theme
                    final receivedMessageColor = _themeController.isThemeDark
                        ? ChatRoomStyles.receivedMessageColorDark
                        : null;

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: received
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: MessageWidget(
                          receivedBackgroundColor: receivedBackgroundColor,
                          receivedMessageColor: receivedMessageColor,
                          chatMessage: _chatController.chatMessages[index],
                          received: received,
                        ),
                      ),
                    );
                  })),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: MessageSender(),
        )
      ],
    );
  }
}
