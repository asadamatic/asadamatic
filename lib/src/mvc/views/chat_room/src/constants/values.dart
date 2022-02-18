import 'package:flutter/material.dart';

class ChatRoomValues {
  static const double actionSize = 28.0;
  static const double actionIconSize = 24.0;
  static const double chatRoomHeightMax = 657.0;
  static const double chatRoomWidthMax = 360.0;
  static const double chatRoomHeightMin = 400.0;
  static const double chatRoomWidthMin = 360.0;
  static const double chatRoomHeightClosed = 0.0;
  static const double chatRoomWidthClosed = 0.0;
  static const Icon resizeIcon = Icon(
    Icons.fullscreen,
    size: actionIconSize,
  );
  static const Icon closeIcon = Icon(
    Icons.close,
    size: actionIconSize,
  );
  static const List<Icon> chatRoomActions = [resizeIcon, closeIcon];
}