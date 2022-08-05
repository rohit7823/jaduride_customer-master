// To parse this JSON data, do
//
//     final baseUrlResponse = baseUrlResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BaseUrlResponse baseUrlResponseFromJson(String str) => BaseUrlResponse.fromJson(json.decode(str));

String baseUrlResponseToJson(BaseUrlResponse data) => json.encode(data.toJson());

class BaseUrlResponse {
  BaseUrlResponse({
    required this.status,
    required this.message,
    required this.baseUrl,
    required this.version,
  });

  final bool status;
  final String message;
  final String baseUrl;
  final Version version;

  factory BaseUrlResponse.fromJson(Map<String, dynamic> json) => BaseUrlResponse(
    status: json["status"],
    message: json["message"],
    baseUrl: json["baseUrl"],
    version: Version.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "baseUrl": baseUrl,
    "version": version.toJson(),
  };
}

class Version {
  Version({
    required this.name,
    required this.code,
    required this.date,
    required this.isSkipable,
  });

  final String name;
  final int code;
  final String date;
  final bool isSkipable;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
    name: json["name"],
    code: json["code"],
    date: json["date"],
    isSkipable: json["isSkipable"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "date": date,
    "isSkipable": isSkipable,
  };
}
