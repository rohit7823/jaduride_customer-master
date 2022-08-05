import 'dart:convert';

import 'package:jaduride/core/app_settings.dart';
import 'package:jaduride/core/models/base_url_response.dart';
import 'package:jaduride/core/models/get_user_id_response.dart';
import 'package:jaduride/core/models/register_user_response.dart';
import 'package:jaduride/core/models/send_otp_response.dart';
import 'package:jaduride/extensions.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../core/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';
import 'di.dart';

class NetworkImpl extends Network {
  var appSettings = instance<AppSettings>();

  @override
  Future<RestResponse<BaseUrlResponse>> fetchBaseUrl() async {
    var url = Uri.parse("${Constants.masterBaseUrl}/baseUrl");

    var headers = {
      'X-API-KEY' : "4c174057-0a6b-4fe8-98df-5699fac7c51a",
      'platform' : 'android',
      'deviceId' : '123'
    };

    try {
      var r = await http.get(url, headers: headers);
      print(r.body);
      if (r.statusCode == 200) {
        var map = json.decode(r.body);
        var ob = BaseUrlResponse.fromJson(map);
        return RestResponse(success: true, error: null, data: ob);
      } else {
        return RestResponse(success: false, error: null, data: null);
      }
    } catch (e) {
      return RestResponse(success: false, error: e, data: null);
    }
  }

  @override
  Future<RestResponse<SendOtpResponse>> sendOtp(String mobile) async {
    var urlText = "${appSettings.baseUrl}customer/verifyMobile?mobile=$mobile";
    var url = Uri.parse(urlText);

    var headers = {
      'X-API-KEY' : "4c174057-0a6b-4fe8-98df-5699fac7c51a",
      'platform' : 'android',
      'deviceId' : '123'
    };

    try {
      var r = await http.get(url, headers: headers);
      if (r.statusCode == 200) {
        var map = json.decode(r.body);
        var ob = SendOtpResponse.fromJson(map);
        return RestResponse(success: true, error: null, data: ob);
      } else {
        return RestResponse(success: false, error: null, data: null);
      }
    } catch (e) {
      return RestResponse(success: false, error: e, data: null);
    }
  }

  @override
  Future<RestResponse<GetUserIdResponse>> userId(String mobile) async {
    var urlText = "${appSettings.baseUrl}customer/user?mobile=$mobile";
    var url = Uri.parse(urlText);

    var headers = {
      'X-API-KEY' : "4c174057-0a6b-4fe8-98df-5699fac7c51a",
      'platform' : 'android',
      'deviceId' : '123'
    };

    try {
      var r = await http.get(url, headers: headers);
      if (r.statusCode == 200) {
        var map = json.decode(r.body);
        var ob = GetUserIdResponse.fromJson(map);
        return RestResponse(success: true, error: null, data: ob);
      } else {
        return RestResponse(success: false, error: null, data: null);
      }
    } catch (e) {
      return RestResponse(success: false, error: e, data: null);
    }
  }

  @override
  Future<RestResponse<RegisterUserResponse>> userSignup(
      String mobile,
      String name,
      String email,
      String
      imagePath
  ) async {
    var r = await multipart(
        "POST",
        "https://jaduridedev.v-xplore.com/customer/user",
        fields: {
          'mobile':mobile,
          'name':name,
          'email':email
        },
        headers: {
          'X-API-KEY' : "4c174057-0a6b-4fe8-98df-5699fac7c51a",
          'platform' : 'android',
          'deviceId' : '123'
        },
        files: [
          await http.MultipartFile.fromPath(
            'profile_image',
            imagePath,
            contentType: MediaType('image', '*'),
          )
        ]
    );
    print(r.body);
    if (r.response.statusCode == 200) {
      var map = json.decode(r.body);
      var ob = RegisterUserResponse.fromJson(map);
      return RestResponse(success: true, error: null, data: ob);
    } else {
      return RestResponse(success: false, error: null, data: null);
    }
  }
}