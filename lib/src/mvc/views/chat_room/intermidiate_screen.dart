import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntermediateScreen extends StatelessWidget {
  IntermediateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
              physics: const NeverScrollableScrollPhysics(),
              controller: _chatController.welcomePageController,
              onPageChanged: _chatController.onWelcomePageChange,
              children: [
                const ConfirmationScreen(),
                PinCodeScreen(
                  authType: AuthType.signIn,
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

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

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
          const Text('Looks like you signed up already'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Continue as",
                style: textTheme.subtitle1,
              ),
              Text(
                _chatController.session!.email!,
                style: textTheme.headline6,
              ),
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
                    textStyle: MaterialStateProperty.all(textTheme.subtitle1)),
                onPressed: _chatController.switchToNextPage,
                child: const Text('Proceed')),
          )
        ],
      ),
    );
  }
}
