import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/welcome_screen.dart';
import 'package:asadamatic/src/widgets/pic_code_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomWelcome extends StatelessWidget {
  ChatRoomWelcome({Key? key}) : super(key: key);

  final ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: PageIndexIndicator(
              pageCount: 3,
            ),
          ),
          Form(
            key: _chatController.visitorFormKey,
            child: PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _chatController.welcomePageController,
              onPageChanged: _chatController.onWelcomePageChange,
              children: [
                EmailScreen(),
                VerificationCodeScreen(),
                PinCodeScreen(
                  authType: AuthType.resetPin,
                ),
              ],
            ),
          ),
          GetBuilder<ChatController>(
              id: 'updateLoadingWidget',
              builder: (_chatController) => Container(
                  color: Colors.white54,
                  child: _chatController.isLoading!
                      ? const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox()))
        ],
      ),
    );
  }
}
