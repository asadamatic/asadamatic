import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/chat_messages.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/widgets/chat_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({Key? key, this.chatMessage, this.received})
      : super(key: key);

  final ChatMessage? chatMessage;
  final bool? received;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 190.0,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chatMessage!.message!,
                textAlign: TextAlign.start,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat.jm().format(chatMessage!.sentTime!),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: received! ? Colors.green : Colors.blue),
        ),
        // GetBuilder(
        //     id: 'messageStatus', builder: (_chatController) => ChatStatus())
      ],
    );
  }
}
