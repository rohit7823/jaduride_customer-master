import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jaduride/app/di.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/core/models/recent_rides.dart';
import 'package:jaduride/core/models/service.dart';
import 'package:jaduride/core/use_cases/fetch_recent_rides_use_case.dart';
import 'package:mobx/mobx.dart';

import '../../core/locator.dart';
import '../../core/models/surrounding_car_positions.dart';
import '../../core/models/time.dart';
import '../../ws.dart';

part 'home_content_view_model.g.dart';

class HomeContentViewModel = _HomeContentViewModel with _$HomeContentViewModel;

abstract class _HomeContentViewModel with Store {
  @observable
  List<Ride> recentRides = [];

  final _fetchRecentRidesUseCase = instance<FetchRecentRidesUseCase>();

  WS? _ws;

  final _locator = instance<Locator>();
  Marker? _marker;

  @observable
  Set<Marker> markers = Set();

  @observable
  Position? currentLocation;

  @observable
  double factor = 0.0;

  @observable
  JaduTime time = JaduTime.Now;

  @action
  onTapService(JaduService service){

  }

  @action
  onInit(){
    fetchRecentRides();
  }

  fetchRecentRides() async{
    var r = await _fetchRecentRidesUseCase.fetchRecentRides();
    if(r.status){
      recentRides = r.rides;
    }
  }

  setupMarkers() async{
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      ImageAssets.car_icon,
    );
    Set<Marker> new_markers = Set();
    _marker = Marker( //add first marker
      anchor: Offset(0.5, 0.5),
      markerId: MarkerId("Marker1"),
      position: LatLng(22.6420997, 88.3389120), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: markerbitmap, //Icon for Marker
    );
    new_markers.add(_marker!);
    markers = new_markers;

    const oneSec = const Duration(milliseconds: 16);
    var _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        markers = markers.map((e) => Marker(
          anchor: e.anchor,
          rotation: e.rotation+0.25,//add first marker
          markerId: MarkerId("Marker1"),
          position: LatLng(22.6420997, 88.3389120), //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'My Custom Title ',
            snippet: 'My Custom Subtitle',
          ),
          icon: markerbitmap, //Icon for Marker
        )
        ).toSet();
      },
    );
  }

  Future<Position> getCurrentLocation() async {
    return await _locator.determinePosition();
  }

  BitmapDescriptor? markerbitmap;
  _onCarsData(dynamic data) async{
    print("ondata999999999999999999999");
    print(data);
    if(data is String){
      if(markerbitmap==null){
        markerbitmap = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(),
          ImageAssets.car_icon,
        );
      }

      var cars = surroundingCarsPositionsFromJson(data);
      markers = cars.map((e){
        return Marker(
          anchor: const Offset(0.5, 0.5),
          rotation: e.rotation,//add first marker
          markerId: MarkerId(e.id),
          position: LatLng(e.position.lat, e.position.lon),
          icon: markerbitmap!, //Icon for Marker
        );
      }).toSet();
    }
  }

  onLocationObtained(Position value){
    print("starting the websocket 985656232");
    _ws = WS('wss://sockettest.v-xplore.com/surroundingCars/a/a123/${value.latitude}/${value.longitude}',true,onData: (ws,data){
      _onCarsData(data);
    })..connect();
  }
}

//flutter pub run build_runner build