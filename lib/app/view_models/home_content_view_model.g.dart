// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeContentViewModel on _HomeContentViewModel, Store {
  late final _$recentRidesAtom =
      Atom(name: '_HomeContentViewModel.recentRides', context: context);

  @override
  List<Ride> get recentRides {
    _$recentRidesAtom.reportRead();
    return super.recentRides;
  }

  @override
  set recentRides(List<Ride> value) {
    _$recentRidesAtom.reportWrite(value, super.recentRides, () {
      super.recentRides = value;
    });
  }

  late final _$markersAtom =
      Atom(name: '_HomeContentViewModel.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$currentLocationAtom =
      Atom(name: '_HomeContentViewModel.currentLocation', context: context);

  @override
  Position? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(Position? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$factorAtom =
      Atom(name: '_HomeContentViewModel.factor', context: context);

  @override
  double get factor {
    _$factorAtom.reportRead();
    return super.factor;
  }

  @override
  set factor(double value) {
    _$factorAtom.reportWrite(value, super.factor, () {
      super.factor = value;
    });
  }

  late final _$timeAtom =
      Atom(name: '_HomeContentViewModel.time', context: context);

  @override
  JaduTime get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(JaduTime value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$_HomeContentViewModelActionController =
      ActionController(name: '_HomeContentViewModel', context: context);

  @override
  dynamic onTapService(JaduService service) {
    final _$actionInfo = _$_HomeContentViewModelActionController.startAction(
        name: '_HomeContentViewModel.onTapService');
    try {
      return super.onTapService(service);
    } finally {
      _$_HomeContentViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInit() {
    final _$actionInfo = _$_HomeContentViewModelActionController.startAction(
        name: '_HomeContentViewModel.onInit');
    try {
      return super.onInit();
    } finally {
      _$_HomeContentViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recentRides: ${recentRides},
markers: ${markers},
currentLocation: ${currentLocation},
factor: ${factor},
time: ${time}
    ''';
  }
}
