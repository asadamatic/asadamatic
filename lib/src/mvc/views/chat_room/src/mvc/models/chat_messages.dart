class ChatMessage {
  int? index;
  String? chatRoomId;
  String? message;
  String? sessionId;
  String? senderEmail;
  String? receiverEmail;
  DateTime? sentTime;
  String? status;

  ChatMessage(
      {this.index,
      this.chatRoomId,
      this.message,
      this.sessionId,
      this.senderEmail,
      this.receiverEmail,
      this.sentTime,
      this.status});

  factory ChatMessage.fromJson(json) {
    return ChatMessage(
        index: json['index'],
        chatRoomId: json['chat_room_id'],
        message: json['message'],
        sessionId: json['session_id'],
        senderEmail: json['sender'],
        receiverEmail: json['receiver'],
        sentTime: DateTime.parse(json['time']),
        status: json['status']);
  }

  Map<String, dynamic> toMap() {
    return {
      'chat_room_id': chatRoomId,
      'message': message,
      'session_id': sessionId,
      'sender': senderEmail,
      'receiver': receiverEmail,
      'time': sentTime.toString(),
      'status': status
    };
  }
}
