import 'package:asadamatic/src/constant/values.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  static const Icon sendIcon = Icon(
    Icons.send,
  );
  static final DateFormat messageTimeFormatter = DateFormat.jm();


// static const List<Icon> chatRoomActions = [resizeIcon, closeIcon];
}
