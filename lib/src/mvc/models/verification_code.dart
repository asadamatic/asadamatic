class VerificationCode {
  String? email;
  DateTime? genTime;
  DateTime? expireTime;
  DateTime? usedTime;
  int? code;
  int? index;
  VerificationCode({this.index, this.email, this.genTime, this.expireTime, this.usedTime, this.code});

  VerificationCode.base({this.index, this.email, this.genTime, this.expireTime});

  Map<String, dynamic> toJson() {

    return {
      'index': index,
      'email': email,
      'gen_time': genTime.toString(),
      'expire_time': expireTime.toString(),
      'code': code,
      'used_time': usedTime.toString()
    };
  }

  factory VerificationCode.baseFromJson(json) {
    return VerificationCode.base(
      index: json['index'],
        email: json['email'],
        genTime: DateTime.parse(json['gen_time']),
        expireTime: DateTime.parse(json['expire_time']));
  }
}
