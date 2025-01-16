part of '../../data.dart';

class EmptyResponse {
  EmptyResponse({
    this.message = "",
    this.success,
    this.data,
  });

  factory EmptyResponse.fromJson(final String str) => EmptyResponse.fromMap(json.decode(str));

  factory EmptyResponse.fromMap(final dynamic json) => EmptyResponse(
        message: json["message"] ?? "",
        success: json["success"] ?? false,
        data: json["data"].toString(),
      );
  final String message;
  final bool? success;
  final dynamic data;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "message": message,
        "success": success,
        "data": data,
      };
}
