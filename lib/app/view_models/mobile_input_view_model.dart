import 'package:jaduride/app/navigation_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/data_state.dart';
import '../../core/models/wrapper.dart';
import '../../core/use_cases/send_otp_use_case.dart';
import '../di.dart';
import '../routes.dart';

part 'mobile_input_view_model.g.dart';

class MobileInputViewModel = _MobileInputViewModel with _$MobileInputViewModel;

abstract class _MobileInputViewModel with Store {
  final _navigator = instance<NavigationService>();
  final _sendOtpUseCase = instance<SendOtpUseCase>();
  String _otp = "";

  @observable
  Wrapper<DataState> otpState = Wrapper(DataState.NORMAL);

  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @observable
  String mobile = "";

  @observable
  bool canProceed = false;

  @action
  onMobileInputChanged(value){
    mobile = value;
    canProceed = mobile.length==12;
  }

  @action
  onContinue(String mobile){
    this.mobile = mobile.replaceAll("-", "");
    sendOtp();
  }

  void sendOtp() async {
    otpState = Wrapper(DataState.LOADING);
    var r = await _sendOtpUseCase.sendOtp(this.mobile);
    if(r==null){
      otpState = Wrapper(DataState.FAILED);
      snackbarMessage = Wrapper("Failed to send otp");
      return;
    }
    _otp = r.otp;
    otpState = Wrapper(DataState.SUCCESS);
    _navigator.navigateTo(Routes.otp,arguments: MobileAndOtp(mobile, _otp));
  }
}

class MobileAndOtp{
  MobileAndOtp(this.mobile,this.otp);
  final String mobile;
  final String otp;
}

//flutter pub run build_runner build