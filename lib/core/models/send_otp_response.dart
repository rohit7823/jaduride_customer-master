// To parse this JSON data, do
//
//     final sendOtpResponse = sendOtpResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SendOtpResponse sendOtpResponseFromJson(String str) => SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) => json.encode(data.toJson());

class SendOtpResponse {
  SendOtpResponse({
    required this.status,
    required this.message,
    required this.otp,
  });

  final bool status;
  final String message;
  final String otp;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) => SendOtpResponse(
    status: json["status"],
    message: json["message"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "otp": otp,
  };
}
