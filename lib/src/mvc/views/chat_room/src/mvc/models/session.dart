class Session {
  String? sessionId;
  DateTime? startTime;
  String? email;
  String? deviceName;
  bool? isActive;

  Session(
      {this.sessionId,
      this.startTime,
      this.email,
      this.deviceName,
      this.isActive});
  factory Session.fromJson(json) {
    return Session(
        sessionId: json['session_id'],
        startTime: DateTime.parse(json['start_time']),
        email: json['email'],
        deviceName: json['device_name'],
        isActive: json['is_active']);
  }
  toMap() {
    return {
      'session_id': sessionId,
      'start_time': startTime.toString(),
      'email': email,
      'device_name': deviceName,
      'is_active': isActive
    };
  }
}
