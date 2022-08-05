// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IntroViewModel on _IntroViewModel, Store {
  late final _$isLastPageAtom =
      Atom(name: '_IntroViewModel.isLastPage', context: context);

  @override
  bool get isLastPage {
    _$isLastPageAtom.reportRead();
    return super.isLastPage;
  }

  @override
  set isLastPage(bool value) {
    _$isLastPageAtom.reportWrite(value, super.isLastPage, () {
      super.isLastPage = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_IntroViewModel.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$_IntroViewModelActionController =
      ActionController(name: '_IntroViewModel', context: context);

  @override
  dynamic onPageChange(int page) {
    final _$actionInfo = _$_IntroViewModelActionController.startAction(
        name: '_IntroViewModel.onPageChange');
    try {
      return super.onPageChange(page);
    } finally {
      _$_IntroViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic skip() {
    final _$actionInfo = _$_IntroViewModelActionController.startAction(
        name: '_IntroViewModel.skip');
    try {
      return super.skip();
    } finally {
      _$_IntroViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onGetStarted() {
    final _$actionInfo = _$_IntroViewModelActionController.startAction(
        name: '_IntroViewModel.onGetStarted');
    try {
      return super.onGetStarted();
    } finally {
      _$_IntroViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLastPage: ${isLastPage},
currentPage: ${currentPage}
    ''';
  }
}
