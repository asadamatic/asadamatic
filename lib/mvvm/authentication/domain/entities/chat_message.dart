class ChatMessage {
  int index;
  String chatRoomId;
  String message;
  String sessionId;
  String senderEmail;
  String receiverEmail;
  DateTime sentTime;
  String status;

  ChatMessage(
      {required this.index,
      required this.chatRoomId,
      required this.message,
      required this.sessionId,
      required this.senderEmail,
      required this.receiverEmail,
      required this.sentTime,
      required this.status});
}
