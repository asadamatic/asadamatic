import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/error_message.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/pic_code_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({Key? key, AuthType? authType})
      : _authType = authType,
        super(key: key);

  final AuthType? _authType;

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    final signingUp = _authType == AuthType.signUp;
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  signingUp ? 'Choose a 4 digit pin!' : 'Enter your pin',
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                signingUp
                    ? Text(
                        'To avoid verification next time.',
                        style: textTheme.titleMedium,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                    width: 200.0,
                    child: PinCodeField(
                      noOfFields: 4,
                    )),
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  child: const Text('Reset Pin'),
                  onTap: () => _chatController.openResetPinScreen(context),
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
                      : signingUp
                          ? _chatController.switchToNextPageOnAnyScreen()
                          : _chatController.verifyPin(),
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
