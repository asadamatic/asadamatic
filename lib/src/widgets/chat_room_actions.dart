import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomActions extends StatelessWidget {
  const ChatRoomActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        id: 'updateChatRoomActions',
        builder: (_chatController) => !_chatController.isLoggedIn
            ? InkWell(
                onTap: _chatController.toggleChatRoom,
                child: Container(
                    margin: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    height: ChatRoomStyles.actionSize,
                    width: ChatRoomStyles.actionSize,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ChatRoomStyles.actionSize),
                    ),
                    child: ChatRoomConstants.closeIcon),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: ChatRoomConstants.chatRoomActions
                    .map(
                      (chatRoomAction) => InkWell(
                        onTap: () => chatRoomAction ==
                                ChatRoomConstants.resizeIcon
                            ? _chatController.changeChatRoomResize(
                                maxHeight: MediaQuery.of(context).size.height,
                                maxWidth: MediaQuery.of(context).size.width)
                            : _chatController.toggleChatRoom(),
                        child: Container(
                            margin: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            height: ChatRoomStyles.actionSize,
                            width: ChatRoomStyles.actionSize,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ChatRoomStyles.actionSize),
                            ),
                            child: chatRoomAction),
                      ),
                    )
                    .toList()));
  }
}
