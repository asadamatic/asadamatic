import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/error_message.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/pic_code_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Container(
        height: 300.0,
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //height: 24.0
                Text(
                  "Enter 6-Digit Code",
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                //height: 16.0
                Text(
                  'Check your email for code.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                    width: 300.0,
                    child: PinCodeField(
                      noOfFields: 6,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GetBuilder<ChatController>(
                        id: 'updateResendButton',
                        builder: (_chatController) => InkWell(
                              child: const Text('Resend code'),
                              onTap: _chatController.timeLeft == Duration.zero
                                  ? () {}
                                  : null,
                            )),
                    Obx(() => Text(
                          _chatController.timeDisplay!.value,
                          style: textTheme.titleLarge,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const ErrorMessage(),
              ],
            ),
            Container(
              width: 200.0,
              height: 50.0,
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                      textStyle:
                          MaterialStateProperty.all(textTheme.titleMedium)),
                  onPressed: () => _chatController.isLoading!
                      ? null
                      : _chatController.verifyCode(),
                  child: GetBuilder<ChatController>(
                      id: 'updateLoadingWidget',
                      builder: (_chatController) => _chatController.isLoading!
                          ? const SizedBox(
                              height: 25.0,
                              width: 25.0,
                              child: CircularProgressIndicator())
                          : const Text('Proceed'))),
            )
          ],
        ));
  }
}
