class Session {
  String? sessionId;
  DateTime? startTime;
  String? email;
  String? deviceName;

  Session({this.sessionId, this.startTime, this.email, this.deviceName});
  factory Session.fromJson(json) {
    return Session(
        sessionId: json['session_id'],
        startTime: DateTime.parse(json['start_time']),
        email: json['email'],
        deviceName: json['device_name']);
  }
}
