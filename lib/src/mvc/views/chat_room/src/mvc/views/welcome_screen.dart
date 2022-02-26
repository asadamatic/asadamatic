import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/email_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/pin_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/user_name_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/verification_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/loading_widget.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/page_index_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomWelcome extends StatelessWidget {
  const ChatRoomWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GetBuilder<ChatController>(
              id: 'changeVerificationScreen',
              builder: (_chatController) => PageIndexIndicator(
                    pageCount: _chatController.userExists! ? 2 : 4,
                    authType: AuthType.signUp,
                  )),
        ),
        Expanded(
          flex: 5,
          child: Form(
            key: _chatController.welcomeFormKey,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
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
        ),
        // const LoadingWidget(),
      ],
    );
  }
}
