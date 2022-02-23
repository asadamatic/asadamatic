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
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Verification code expires in 3 minutes',
                    style: textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Obx(() => Text(
                      _chatController.timeDisplay!.value,
                      style: textTheme.headline6,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    width: 300.0,
                    child: PinCodeField(
                      noOfFields: 6,
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  child: GetBuilder<ChatController>(
                      id: 'updateResendButton',
                      builder: (_chatController) =>
                          _chatController.timeLeft == Duration.zero
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: const Text('Resend code'),
                                    onTap: () {},
                                  ),
                                )
                              : const SizedBox(
                                  height: 16.0,
                                )),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const ErrorMessage()
              ],
            ),
            Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                      textStyle:
                          MaterialStateProperty.all(textTheme.subtitle1)),
                  onPressed: _chatController.verifyCode,
                  child: const Text('Submit')),
            )
          ],
        ));
  }
}
