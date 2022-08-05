// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModel, Store {
  late final _$showDialogAtom =
      Atom(name: '_SplashViewModel.showDialog', context: context);

  @override
  DialogTrigger get showDialog {
    _$showDialogAtom.reportRead();
    return super.showDialog;
  }

  @override
  set showDialog(DialogTrigger value) {
    _$showDialogAtom.reportWrite(value, super.showDialog, () {
      super.showDialog = value;
    });
  }

  late final _$retriedAtom =
      Atom(name: '_SplashViewModel.retried', context: context);

  @override
  int get retried {
    _$retriedAtom.reportRead();
    return super.retried;
  }

  @override
  set retried(int value) {
    _$retriedAtom.reportWrite(value, super.retried, () {
      super.retried = value;
    });
  }

  late final _$_SplashViewModelActionController =
      ActionController(name: '_SplashViewModel', context: context);

  @override
  dynamic onInit() {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.onInit');
    try {
      return super.onInit();
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRetried({int value = -1}) {
    final _$actionInfo = _$_SplashViewModelActionController.startAction(
        name: '_SplashViewModel.onRetried');
    try {
      return super.onRetried(value: value);
    } finally {
      _$_SplashViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showDialog: ${showDialog},
retried: ${retried}
    ''';
  }
}
