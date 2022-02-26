import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/error_message.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
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
                'Helps improve chat experience.',
                style: textTheme.subtitle1,
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 80.0,
                child: TextFormField(
                  validator: _chatController.nameValidator,
                  controller: _chatController.nameEditingController,
                  onChanged: _chatController.onNameChanged,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Asad Hameed'),
                ),
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
                    textStyle: MaterialStateProperty.all(textTheme.subtitle1)),
                onPressed: () => _chatController.setUserData(context),
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
      ),
    );
  }
}
