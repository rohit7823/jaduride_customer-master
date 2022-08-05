// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonalDetailsViewModel on _PersonalDetailsViewModel, Store {
  late final _$snackbarMessageAtom =
      Atom(name: '_PersonalDetailsViewModel.snackbarMessage', context: context);

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

  late final _$showPickSourceDialogAtom = Atom(
      name: '_PersonalDetailsViewModel.showPickSourceDialog', context: context);

  @override
  DialogTrigger get showPickSourceDialog {
    _$showPickSourceDialogAtom.reportRead();
    return super.showPickSourceDialog;
  }

  @override
  set showPickSourceDialog(DialogTrigger value) {
    _$showPickSourceDialogAtom.reportWrite(value, super.showPickSourceDialog,
        () {
      super.showPickSourceDialog = value;
    });
  }

  late final _$fileAtom =
      Atom(name: '_PersonalDetailsViewModel.file', context: context);

  @override
  File? get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File? value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  late final _$validAtom =
      Atom(name: '_PersonalDetailsViewModel.valid', context: context);

  @override
  bool get valid {
    _$validAtom.reportRead();
    return super.valid;
  }

  @override
  set valid(bool value) {
    _$validAtom.reportWrite(value, super.valid, () {
      super.valid = value;
    });
  }

  late final _$submittingAtom =
      Atom(name: '_PersonalDetailsViewModel.submitting', context: context);

  @override
  bool get submitting {
    _$submittingAtom.reportRead();
    return super.submitting;
  }

  @override
  set submitting(bool value) {
    _$submittingAtom.reportWrite(value, super.submitting, () {
      super.submitting = value;
    });
  }

  late final _$_PersonalDetailsViewModelActionController =
      ActionController(name: '_PersonalDetailsViewModel', context: context);

  @override
  dynamic onNameChanged(String value) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.onNameChanged');
    try {
      return super.onNameChanged(value);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String value) {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.onEmailChanged');
    try {
      return super.onEmailChanged(value);
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubmit() {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.onSubmit');
    try {
      return super.onSubmit();
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pickFile() {
    final _$actionInfo = _$_PersonalDetailsViewModelActionController
        .startAction(name: '_PersonalDetailsViewModel.pickFile');
    try {
      return super.pickFile();
    } finally {
      _$_PersonalDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
snackbarMessage: ${snackbarMessage},
showPickSourceDialog: ${showPickSourceDialog},
file: ${file},
valid: ${valid},
submitting: ${submitting}
    ''';
  }
}
