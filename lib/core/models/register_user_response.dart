import 'dart:convert';

RegisterUserResponse registerUserResponseFromJson(String str) => RegisterUserResponse.fromJson(json.decode(str));

String registerUserResponseToJson(RegisterUserResponse data) => json.encode(data.toJson());

class RegisterUserResponse {
  RegisterUserResponse({
    required this.status,
    required this.message,
    required this.userId,
  });

  final bool status;
  final String message;
  final String userId;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) => RegisterUserResponse(
    status: json["status"],
    message: json["message"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "userId": userId,
  };
}
