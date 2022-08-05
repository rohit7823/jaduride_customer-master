
import 'package:jaduride/core/models/get_user_id_response.dart';
import 'package:jaduride/core/models/register_user_response.dart';
import 'package:jaduride/core/models/send_otp_response.dart';

import 'models/base_url_response.dart';

class RestResponse<T>{
  bool success;
  dynamic error;
  T? data;

  RestResponse({required this.success, required this.error, required this.data});
}
abstract class Network{
  Future<RestResponse<BaseUrlResponse>> fetchBaseUrl();
  Future<RestResponse<SendOtpResponse>> sendOtp(String mobile);
  Future<RestResponse<GetUserIdResponse>> userId(String mobile);
  Future<RestResponse<RegisterUserResponse>> userSignup(
      String mobile,
      String name,
      String email,
      String imagePath
  );
}