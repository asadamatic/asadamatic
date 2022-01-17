import 'package:asadamatic/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChatRoomWelcome extends StatelessWidget {
  ChatRoomWelcome({Key? key}) : super(key: key);

  final ChatController _chatController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Please provide your email to continue!',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            GetBuilder<ChatController>(
              id: 'updateEmailForm',
              builder: (_chatController) {
                return Form(
                    key: _chatController.emailFormKey,
                    child: TextFormField(
                      validator: _chatController.emailValidator,
                      controller: _chatController.emailEditingController,
                      onChanged: _chatController.onEmailChanged,
                      decoration: InputDecoration(
                        errorText: _chatController.emailErrorText,
                          border: OutlineInputBorder(),
                          hintText: 'example@gmail.com'),
                    ));
              }
            ),
            ElevatedButton(
                onPressed: _chatController.processEmail, child: Text('Proceed'))
          ],
        ),
      ),
    );
  }
}
