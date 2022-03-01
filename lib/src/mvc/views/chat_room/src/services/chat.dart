import 'dart:convert';

import 'package:asadamatic/src/constant/secrets.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/chat_messages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ChatService extends GetConnect {
  final url = kDebugMode
      ? GetPlatform.isAndroid
          ? localHostUrlAndroid
          : localHostUrl
      : remoteHostUrl;

  final messages = 'messages/';
  final newMessage = 'new-message';

  Future<Response> loadMessages(String? email) async {
    final response = await get(url + messages, query: {'chat_room_id': email});
    return response;
  }

  Future<Response> sendMessage(ChatMessage chatMessage) async {
    final response = await post(url + newMessage, jsonEncode(chatMessage.toMap()));
    return response;
  }
}
