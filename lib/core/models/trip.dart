class Trip {
  final String uuid;
  final TripLocation origin;
  final TripLocation destiny;
  final String userUuid;

  Trip({
    required this.uuid,
    required this.origin,
    required this.destiny,
    required this.userUuid,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      uuid: json['uuid'],
      origin: TripLocation.fromJson(json['origin']),
      destiny: TripLocation.fromJson(json['destiny']),
      userUuid: json['user_uuid'],
    );
  }
}

class TripLocation {
  final String latitude;
  final String longitude;

  TripLocation({
    required this.latitude,
    required this.longitude,
  });

  factory TripLocation.fromJson(Map<String, dynamic> json) {
    return TripLocation(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
