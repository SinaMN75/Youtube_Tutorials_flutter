part of '../../data.dart';

class LoginParams {
  LoginParams({
    required this.phone,
    required this.password,
  });

  factory LoginParams.fromJson(final String str) => LoginParams.fromMap(json.decode(str));

  factory LoginParams.fromMap(final Map<String, dynamic> json) => LoginParams(
        phone: json["phone"],
        password: json["password"],
      );
  final String phone;
  final String password;

  String toJson() => json.encode(toMap()).englishNumber();

  Map<String, dynamic> toMap() => <String, dynamic>{
        "phone": phone,
        "password": password,
      };
}
