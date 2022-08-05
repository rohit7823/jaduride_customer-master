import 'dart:convert';

RecentRides recentRidesFromJson(String str) => RecentRides.fromJson(json.decode(str));

String recentRidesToJson(RecentRides data) => json.encode(data.toJson());

class RecentRides {
  RecentRides({
    required this.status,
    required this.message,
    required this.rides,
  });

  final bool status;
  final String message;
  final List<Ride> rides;

  factory RecentRides.fromJson(Map<String, dynamic> json) => RecentRides(
    status: json["status"],
    message: json["message"],
    rides: List<Ride>.from(json["rides"].map((x) => Ride.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rides": List<dynamic>.from(rides.map((x) => x.toJson())),
  };
}

class Ride {
  Ride({
    required this.id,
    required this.from,
    required this.to,
  });

  final String id;
  final AddressPoint from;
  final AddressPoint to;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json["id"],
    from: AddressPoint.fromJson(json["from"]),
    to: AddressPoint.fromJson(json["to"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from.toJson(),
    "to": to.toJson(),
  };
}

class AddressPoint {
  AddressPoint({
    required this.address,
    required this.place,
  });

  final String address;
  final String place;

  factory AddressPoint.fromJson(Map<String, dynamic> json) => AddressPoint(
    address: json["address"],
    place: json["place"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "place": place,
  };
}
