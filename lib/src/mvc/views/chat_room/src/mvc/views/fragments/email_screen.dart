import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/auth_type.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key, AuthType? authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 300.0,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //height: 24.0
              Text(
                "What's Your Email ?",
                style: textTheme.headline5,
              ),
              const SizedBox(
                height: 15.0,
              ),
              //height: 16.0
              Text(
                'We need to verify your identity.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15.0,
              ),
              //height: 60.0
              SizedBox(
                height: 80.0,
                child: TextFormField(
                  validator: _chatController.emailValidator,
                  controller: _chatController.emailEditingController,
                  onChanged: _chatController.onEmailChanged,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'example@gmail.com'),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ErrorMessage()
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
                onPressed: () => _chatController.verifyEmail(context),
                child: const Text('Proceed')),
          )
        ],
      ),
    );
  }
}
