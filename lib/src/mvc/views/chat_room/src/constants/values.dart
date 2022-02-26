import 'package:asadamatic/src/constant/values.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/styles/values.dart';
import 'package:flutter/material.dart';

class ChatRoomConstants {
  static const Icon resizeIcon = Icon(
    Icons.fullscreen,
    // size: ChatRoomStyles.actionIconSize,
  );
  static final Icon closeIcon = Icon(
    AppConstants.isWebMobile ? Icons.arrow_back_ios_new : Icons.close,
    // size: ChatRoomStyles.actionIconSize,
  );
  static const Icon settingsIcon = Icon(
    Icons.settings,
    // size: ChatRoomStyles.actionIconSize,
  );
  // static const List<Icon> chatRoomActions = [resizeIcon, closeIcon];
}
