// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_input_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobileInputViewModel on _MobileInputViewModel, Store {
  late final _$otpStateAtom =
      Atom(name: '_MobileInputViewModel.otpState', context: context);

  @override
  Wrapper<DataState> get otpState {
    _$otpStateAtom.reportRead();
    return super.otpState;
  }

  @override
  set otpState(Wrapper<DataState> value) {
    _$otpStateAtom.reportWrite(value, super.otpState, () {
      super.otpState = value;
    });
  }

  late final _$snackbarMessageAtom =
      Atom(name: '_MobileInputViewModel.snackbarMessage', context: context);

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

  late final _$mobileAtom =
      Atom(name: '_MobileInputViewModel.mobile', context: context);

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

  late final _$canProceedAtom =
      Atom(name: '_MobileInputViewModel.canProceed', context: context);

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

  late final _$_MobileInputViewModelActionController =
      ActionController(name: '_MobileInputViewModel', context: context);

  @override
  dynamic onMobileInputChanged(dynamic value) {
    final _$actionInfo = _$_MobileInputViewModelActionController.startAction(
        name: '_MobileInputViewModel.onMobileInputChanged');
    try {
      return super.onMobileInputChanged(value);
    } finally {
      _$_MobileInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onContinue(String mobile) {
    final _$actionInfo = _$_MobileInputViewModelActionController.startAction(
        name: '_MobileInputViewModel.onContinue');
    try {
      return super.onContinue(mobile);
    } finally {
      _$_MobileInputViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
otpState: ${otpState},
snackbarMessage: ${snackbarMessage},
mobile: ${mobile},
canProceed: ${canProceed}
    ''';
  }
}
