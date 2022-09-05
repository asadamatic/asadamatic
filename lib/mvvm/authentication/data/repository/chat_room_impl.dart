import 'package:asadamatic/mvvm/authentication/domain/repositories/send_message_repository.dart';
import 'package:asadamatic/mvvm/authentication/domain/entities/chat_message.dart';

class ChatRoomImpl implements ChatRoomRepo{

  @override
  Future<ChatMessage> sendMessage(ChatMessage chatMessage) async{
    throw(UnimplementedError);
  }

  @override
  Future<List<ChatMessage>> getMessage(String chatRoomID) {
    throw(UnimplementedError);
  }
}