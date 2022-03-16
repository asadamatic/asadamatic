import 'dart:convert';
import 'package:asadamatic/src/constant/secrets.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/chat_messages.dart';
import 'package:asadamatic/src/mvc/views/chat_room/src/mvc/models/session.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ChatService extends GetConnect {
  final url = kDebugMode
      ? GetPlatform.isAndroid
          ? localHostUrlAndroid
          : localHostUrl
      : remoteHostUrl;

  final messages = 'messages';
  final newMessage = 'new-message';

  Future<Response> getMessages( Session? session) async {
    final response = await post(url + messages, session!.toMap());
    return response;
  }

  Future<Response> sendMessage(ChatMessage chatMessage) async {
    final response =
        await post(url + newMessage, jsonEncode(chatMessage.toMap()));
    return response;
  }
}
