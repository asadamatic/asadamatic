import 'package:asadamatic/mvvm/authentication/domain/repositories/send_message_repository.dart';
import 'package:asadamatic/mvvm/authentication/domain/entities/chat_message.dart';

class SendMessage {
  final ChatRoomRepo _chatRoomRepo;

  SendMessage(this._chatRoomRepo);

  Future<ChatMessage> call() async{
    throw(UnimplementedError);
  }
}