import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageSender extends StatelessWidget {
  const MessageSender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController _chatController = Get.find();
    return Card(
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Form(
              key: _chatController.messageFormKey,
              child: SizedBox(
                height: 40.0,
                child: TextFormField(
                  // controller: _chatController.messageEditingController,
                  validator: _chatController.messageValidator,
                  onChanged: _chatController.onMessageChanged,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(height: 0.0, fontSize: 0.0),
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                ),
              ),
            ),
          ),
          GetBuilder<ChatController>(
            id: 'updateMessageButton',
            builder: (_chatController) {
              return IconButton(
                icon: ChatRoomConstants.sendIcon,
                onPressed: _chatController.message!.isNotEmpty ? _chatController.sendMessage : null,
              );
            }
          )
        ],
      ),
    );
  }
}
