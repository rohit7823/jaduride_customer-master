import 'package:jaduride/core/models/send_otp_response.dart';
import 'package:jaduride/core/network.dart';

import '../../core/use_cases/send_otp_use_case.dart';
import '../di.dart';

class SendOtpUseCaseImpl extends SendOtpUseCase{
  var _network = instance<Network>();
  @override
  Future<SendOtpResponse?> sendOtp(String mobile) async {
    var r = await _network.sendOtp(mobile);
    if(r.data!=null){
      return r.data;
    }
    /*await Future.delayed(Duration(seconds: 2));
    return SendOtpResponse(
        status: true,
        message: "Otp send successfully to $mobile",
        otp: "1234"
    );*/
  }

}