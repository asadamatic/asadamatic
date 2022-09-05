import 'package:asadamatic/mvvm/authentication/domain/entities/chat_message.dart';

abstract class ChatRoomRepo {
  Future<ChatMessage> sendMessage(ChatMessage chatMessage);
  Future<List<ChatMessage>> getMessage(String chatRoomID);
}