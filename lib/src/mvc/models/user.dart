class User {
  String? email;
  String? name;
  int? pin;

  User({this.email, this.name, this.pin});

  User.name({this.email});

  Map<String, dynamic> pinToJson() {
    return {
      'email': email,
      'pin': pin,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'pin': pin,
    };
  }
}
