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
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: PageIndexIndicator(
              pageCount: 3,
            ),
          ),
          Form(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _chatController.resetPinPageController,
              onPageChanged: _chatController.onWelcomePageChange,
              children: const [
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
