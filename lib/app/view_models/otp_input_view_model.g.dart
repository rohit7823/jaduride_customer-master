// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OtpInputViewModel on _OtpInputViewModel, Store {
  late final _$canProceedAtom =
      Atom(name: '_OtpInputViewModel.canProceed', context: context);

  @override
  bool get canProceed {
    _$canProceedAtom.reportRead();
    return super.canProceed;
  }

  @override
  set canProceed(bool value) {
    _$canProceedAtom.reportWrite(value, super.canProceed, () {
      super.canProceed = value;
    });
  }

  late final _$verifyingAtom =
      Atom(name: '_OtpInputViewModel.verifying', context: context);

  @override
  bool get verifying {
    _$verifyingAtom.reportRead();
    return super.verifying;
  }

  @override
  set verifying(bool value) {
    _$verifyingAtom.reportWrite(value, super.verifying, () {
      super.verifying = value;
    });
  }

  late final _$mobileAtom =
      Atom(name: '_OtpInputViewModel.mobile', context: context);

  @override
  String get mobile {
    _$mobileAtom.reportRead();
    return super.mobile;
  }

  @override
  set mobile(String value) {
    _$mobileAtom.reportWrite(value, super.mobile, () {
      super.mobile = value;
    });
  }

  late final _$otpAtom = Atom(name: '_OtpInputViewModel.otp', context: context);

  @override
  String get otp {
    _$otpAtom.reportRead();
    return super.otp;
  }

  @override
  set otp(String value) {
    _$otpAtom.reportWrite(value, super.otp, () {
      super.otp = value;
    });
  }

  late final _$input_otpAtom =
      Atom(name: '_OtpInputViewModel.input_otp', context: context);

  @override
  String get input_otp {
    _$input_otpAtom.reportRead();
    return super.input_otp;
  }

  @override
  set input_otp(String value) {
    _$input_otpAtom.reportWrite(value, super.input_otp, () {
      super.input_otp = value;
    });
  }

  late final _$snackbarMessageAtom =
      Atom(name: '_OtpInputViewModel.snackbarMessage', context: context);

  @override
  Wrapper<String> get snackbarMessage {
    _$snackbarMessageAtom.reportRead();
    return super.snackbarMessage;
  }

  @override
  set snackbarMessage(Wrapper<String> value) {
    _$snackbarMessageAtom.reportWrite(value, super.snackbarMessage, () {
      super.snackbarMessage = value;
    });
  }

  late final _$_OtpInputViewModelActionController =
      ActionController(name: '_OtpInputViewModel', context: context);

  @override
  dynamic onMobileAndOtp(MobileAndOtp mobileAndOtp) {
    final _$actionInfo = _$_OtpInputViewModelActionController.startAction(
        name: '_OtpInputViewModel.onMobileAndOtp');
    try {
      return super.onMobileAndOtp(mobileAndOtp);
    } finally {
      _$_OtpInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInputOtpChange(String value) {
    final _$actionInfo = _$_OtpInputViewModelActionController.startAction(
        name: '_OtpInputViewModel.onInputOtpChange');
    try {
      return super.onInputOtpChange(value);
    } finally {
      _$_OtpInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onVerifyOtp() {
    final _$actionInfo = _$_OtpInputViewModelActionController.startAction(
        name: '_OtpInputViewModel.onVerifyOtp');
    try {
      return super.onVerifyOtp();
    } finally {
      _$_OtpInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canProceed: ${canProceed},
verifying: ${verifying},
mobile: ${mobile},
otp: ${otp},
input_otp: ${input_otp},
snackbarMessage: ${snackbarMessage}
    ''';
  }
}
