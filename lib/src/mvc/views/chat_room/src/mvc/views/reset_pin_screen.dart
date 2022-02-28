import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/email_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/pin_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/views/fragments/verification_code_screen.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/page_index_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPinScreen extends StatelessWidget {
  const ResetPinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Flexible(
            child: PageIndexIndicator(
              pageCount: 3,
              authType: AuthType.resetPin,
            ),
          ),
          Expanded(
            flex: 5,
            child: Form(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _chatController.resetPinPageController,
                onPageChanged: _chatController.onWelcomePageChange,
                children: const [
                  EmailScreen(
                    authType: AuthType.resetPin,
                  ),
                  VerificationCodeScreen(),
                  PinCodeScreen(
                    authType: AuthType.resetPin,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
