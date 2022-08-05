// To parse this JSON data, do
//
//     final surroundingCarsPositions = surroundingCarsPositionsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SurroundingCarsPositions> surroundingCarsPositionsFromJson(String str) => List<SurroundingCarsPositions>.from(json.decode(str).map((x) => SurroundingCarsPositions.fromJson(x)));

String surroundingCarsPositionsToJson(List<SurroundingCarsPositions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurroundingCarsPositions {
    SurroundingCarsPositions({
        required this.id,
        required this.position,
        required this.rotation,
    });

    final String id;
    final CarPosition position;
    final double rotation;

    factory SurroundingCarsPositions.fromJson(Map<String, dynamic> json) => SurroundingCarsPositions(
        id: json["id"],
        position: CarPosition.fromJson(json["position"]),
        rotation: json["rotation"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "position": position.toJson(),
        "rotation": rotation,
    };
}

class CarPosition {
    CarPosition({
        required this.lat,
        required this.lon,
    });

    final double lat;
    final double lon;

    factory CarPosition.fromJson(Map<String, dynamic> json) => CarPosition(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}
