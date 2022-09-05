import 'package:asadamatic/mvvm/authentication/domain/repositories/send_message_repository.dart';
import 'package:asadamatic/mvvm/authentication/domain/entities/chat_message.dart';

class GetMessages {
  final ChatRoomRepo _chatRoomRepo;

  GetMessages(this._chatRoomRepo);

  Future<List<ChatMessage>> call() async{
    throw(UnimplementedError);
  }
}