import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Container(
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
          Column(
            children: [
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
                    onPressed: _chatController.switchToNextPageOnAnyScreen,
                    child: const Text('Proceed')),
              ),
              const SizedBox(
                height: 15.0,
              ),
              InkWell(
                child: const Text(' Use a different email address!'),
                onTap: _chatController.differentEmail,
              )
            ],
          ),
        ],
      ),
    );
  }
}
