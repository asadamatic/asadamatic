import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';

class ChatRoomConstants {


  static const Icon resizeIcon = Icon(
    Icons.fullscreen,
    size: ChatRoomStyles.actionIconSize,
  );
  static const Icon closeIcon = Icon(
    Icons.close,
    size: ChatRoomStyles.actionIconSize,
  );
  static const List<Icon> chatRoomActions = [resizeIcon, closeIcon];
}
