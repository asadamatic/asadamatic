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
      body: Center(
        child: Column(
          children: [
            Text('Please provide your email to continue!'),
            Form(
                child: TextFormField(
              validator: _chatController.emailValidator,
              controller: _chatController.emailEditingController,
              decoration: InputDecoration(hintText: 'example@gmail.com'),
            )),
            ElevatedButton(
                onPressed: _chatController.processEmail, child: Text('Proceed'))
          ],
        ),
      ),
    );
  }
}
