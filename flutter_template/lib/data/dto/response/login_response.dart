part of '../../data.dart';

class LoginResponse {
  LoginResponse({
    this.message,
    this.success,
    this.data,
  });

  factory LoginResponse.fromJson(final String str) => LoginResponse.fromMap(json.decode(str));

  factory LoginResponse.fromMap(final dynamic json) => LoginResponse(
        message: json["message"],
        success: json["success"],
        data: json["data"] == null ? null : LoginData.fromMap(json["data"]),
      );
  final String? message;
  final bool? success;
  final LoginData? data;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "message": message,
        "success": success,
        "data": data?.toMap(),
      };
}

class LoginData {
  LoginData({
    this.privateKey,
    this.address,
    this.token,
  });

  factory LoginData.fromMap(final dynamic json) => LoginData(
        privateKey: json["private_key"],
        address: json["address"],
        token: json["token"],
      );

  factory LoginData.fromJson(final String str) => LoginData.fromMap(json.decode(str));
  final String? privateKey;
  final String? address;
  final String? token;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "private_key": privateKey,
        "address": address,
        "token": token,
      };
}
