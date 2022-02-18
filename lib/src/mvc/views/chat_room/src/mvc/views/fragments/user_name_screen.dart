import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameScreen extends StatelessWidget {
  const UserNameScreen({
    Key? key,
  }) : super(key: key);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's Your Name ?",
                style: textTheme.headline5,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Help improves chat experience.',
                style: textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                validator: _chatController.nameValidator,
                controller: _chatController.nameEditingController,
                onChanged: _chatController.onNameChanged,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Asad Hameed'),
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
                onPressed: () => _chatController.updateUserData(context),
                child: const Text('Proceed')),
          )
        ],
      ),
    );
  }
}
