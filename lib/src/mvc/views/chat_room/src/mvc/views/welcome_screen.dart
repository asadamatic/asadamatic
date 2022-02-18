import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/email_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/pin_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/user_name_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/verification_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/page_index_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomWelcome extends StatelessWidget {
  const ChatRoomWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GetBuilder<ChatController>(
                id: 'changeVerificationScreen',
                builder: (_chatController) => PageIndexIndicator(
                      pageCount: _chatController.userExists! ? 2 : 4,
                      authType: AuthType.signUp,
                    )),
          ),
          Form(
            key: _chatController.welcomeFormKey,
            child: PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: _chatController.welcomePageController,
              onPageChanged: _chatController.onWelcomePageChange,
              children: [
                const EmailScreen(
                  authType: AuthType.signUp,
                ),
                GetBuilder<ChatController>(
                    id: 'changeVerificationScreen',
                    builder: (_chatController) => _chatController.userExists!
                        ? const PinCodeScreen(
                            authType: AuthType.signIn,
                          )
                        : const VerificationCodeScreen()),
                const PinCodeScreen(
                  authType: AuthType.signUp,
                ),
                const UserNameScreen(),
              ],
            ),
          ),
          const LoadingWidget()
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        id: 'updateLoadingWidget',
        builder: (_chatController) => Container(
            color: Colors.white54,
            child: _chatController.isLoading!
                ? const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()));
  }
}
