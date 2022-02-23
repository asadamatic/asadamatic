import 'package:asadamatic/src/mvc/controllers/theme_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/main.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/widgets/chat_room_actions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomContainer extends StatelessWidget {
  ChatRoomContainer({Key? key}) : super(key: key);

  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        id: 'updateChatRoomContainer',
        builder: (_controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  width: _controller.chatRoomWidth,
                  height: _controller.chatRoomHeight,
                  duration: const Duration(milliseconds: 600),
                  child:
                      GetBuilder<ThemeController>(builder: (_themeController) {
                    return Offstage(
                      offstage: !_controller.chatRoomOpen,
                      child: Stack(
                        children: const [
                          ChatRoom(),
                          Align(
                              alignment: Alignment.topLeft,
                              child: ChatRoomActions())
                        ],
                      ),
                    );
                  }),
                ),
              ),
              FloatingActionButton(
                onPressed: _controller.toggleChatRoom,
                child: Icon(_controller.chatRoomOpen
                    ? Icons.keyboard_arrow_down
                    : Icons.chat),
              )
            ],
          );
        });
  }
}
