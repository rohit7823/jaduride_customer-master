// To parse this JSON data, do
//
//     final getUserIdResponse = getUserIdResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetUserIdResponse getUserIdResponseFromJson(String str) => GetUserIdResponse.fromJson(json.decode(str));

String getUserIdResponseToJson(GetUserIdResponse data) => json.encode(data.toJson());

class GetUserIdResponse {
  GetUserIdResponse({
    required this.status,
    required this.message,
    required this.userId,
  });

  final bool status;
  final String message;
  final String? userId;

  factory GetUserIdResponse.fromJson(Map<String, dynamic> json) => GetUserIdResponse(
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