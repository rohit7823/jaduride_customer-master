import 'package:jaduride/core/models/send_otp_response.dart';

abstract class SendOtpUseCase{
  Future<SendOtpResponse?> sendOtp(String mobile);
}