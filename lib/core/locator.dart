import 'package:geolocator/geolocator.dart';

abstract class Locator{
  Future<Position> determinePosition();
}