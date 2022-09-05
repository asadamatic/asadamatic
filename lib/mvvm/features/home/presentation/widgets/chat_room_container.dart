import 'package:asadamatic/mvvm/core/constants/values.dart';
import 'package:asadamatic/mvvm/core/get/controllers/theme_controller.dart';
import 'package:asadamatic/mvvm/authentication/presentation/get/chat_controller.dart';
import 'package:asadamatic/mvvm/authentication/presentation/pages/chat/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomContainer extends StatelessWidget {
  const ChatRoomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _chatController = Get.put(ChatController());
    // final size = MediaQuery.of(context).size;
    // final mobileScreen = size.height < AppStyles.mobileHeight &&
    //     size.width < AppStyles.mobileWidth;
    return GetBuilder<ChatController>(
        id: 'updateChatRoomContainer',
        builder: (_controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Not mobile screen
              AppConstants.isWebMobile
                  ? const SizedBox()
                  : Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        width: _controller.chatRoomWidth,
                        height: _controller.chatRoomHeight,
                        duration: const Duration(milliseconds: 600),
                        child: GetBuilder<ThemeController>(
                            builder: (_themeController) {
                          return Offstage(
                            offstage: !_controller.chatRoomOpen,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: ChatRoom()),
                          );
                        }),
                      ),
                    ),
              FloatingActionButton(
                onPressed: AppConstants.isWebMobile
                    ? _chatController.pushPopChatRoom
                    : _controller.toggleChatRoom,
                child: Icon(_controller.chatRoomOpen
                    ? Icons.keyboard_arrow_down
                    : Icons.chat),
              )
            ],
          );
        });
  }
}