import 'dart:convert';

import 'package:jaduride/app/constants.dart';
import 'package:jaduride/app/navigation_service.dart';
import 'package:jaduride/app/view_models/mobile_input_view_model.dart';
import 'package:jaduride/core/use_cases/fetch_user_id_use_case.dart';
import 'package:mobx/mobx.dart';

import 'package:crypto/crypto.dart' as crypto;

import '../../core/models/wrapper.dart';
import '../di.dart';
import '../routes.dart';

part 'otp_input_view_model.g.dart';

class OtpInputViewModel = _OtpInputViewModel with _$OtpInputViewModel;

abstract class _OtpInputViewModel with Store {
  final _fetchUserIdUseCase = instance<FetchUserIdUseCase>();
  final _navigator = instance<NavigationService>();
  @observable
  bool canProceed = false;

  @observable
  bool verifying = false;

  @observable
  String mobile = "";

  @observable
  String otp = "";

  @observable
  String input_otp = "";

  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @action
  onMobileAndOtp(MobileAndOtp mobileAndOtp){
    mobile = mobileAndOtp.mobile;
    otp = mobileAndOtp.otp;
  }

  @action
  onInputOtpChange(String value){
    input_otp = value;
    canProceed = input_otp.length==4;
  }

  @action
  onVerifyOtp(){
    var md5 = crypto.md5;
    var digest = md5.convert(utf8.encode(input_otp)).toString();
    if(digest==otp){
      onOtpValid();
    }
    else{
      onOtpInvalid();
    }
  }

  onOtpValid() async{
    verifying = true;
    var userIdResponse = await _fetchUserIdUseCase.userId(mobile);
    verifying = false;
    if(userIdResponse==null){
      snackbarMessage = Wrapper(Constants.tryAgain);
      return;
    }
    var userId = userIdResponse.userId;
    if(userId==null){
      _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.personalDetails,arguments: mobile);
    }
  }

  onOtpInvalid(){
    snackbarMessage = Wrapper(Constants.wrongOtp);
  }
}

//flutter pub run build_runner build