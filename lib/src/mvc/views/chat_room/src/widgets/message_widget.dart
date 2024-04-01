import 'package:asadamatic/src/mvc/views/chat_room/src/constants/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/chat_messages.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {Key? key,
      this.chatMessage,
      this.received,
      this.receivedBackgroundColor,
      this.receivedMessageColor})
      : super(key: key);

  final ChatMessage? chatMessage;
  final bool? received;
  final Color? receivedBackgroundColor;
  final Color? receivedMessageColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        Container(
            width: 190.0,
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.all(8.0),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    chatMessage!.message!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: textTheme.titleMedium!.fontSize,
                        color:
                            received! ? null : ChatRoomStyles.sentMessageColor),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ChatRoomConstants.messageTimeFormatter
                        .format(chatMessage!.sentTime!),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: textTheme.labelSmall!.fontSize,
                        color:
                            received! ? null : ChatRoomStyles.sentMessageColor),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: received! ? receivedBackgroundColor : theme.primaryColor,
            )),
        // GetBuilder(
        //     id: 'messageStatus', builder: (_chatController) => ChatStatus())
      ],
    );
  }
}
