import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/confirmation_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/pin_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/page_index_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Column(
        children: [
          const Flexible(
            child: PageIndexIndicator(
                pageCount: 2,
                authType: AuthType.signUp,
              ),
          ),
          Expanded(
            flex: 5,
            child: Form(
              key: _chatController.welcomeFormKey,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _chatController.welcomePageController,
                onPageChanged: _chatController.onWelcomePageChange,
                children: const [
                  ConfirmationScreen(),
                  PinCodeScreen(
                    authType: AuthType.signIn,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }
}
