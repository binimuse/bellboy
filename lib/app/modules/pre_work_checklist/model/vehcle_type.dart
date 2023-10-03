/// A class representing a vehicle type.
class VehicleType {
  final String name;
  final String image;
  final String date;

  /// Creates a new instance of [VehicleType].
  ///
  /// The [name], [image], and [date] parameters are required.
  VehicleType({required this.name, required this.image, required this.date});

  /// Creates a new instance of [VehicleType] from a JSON map.
  ///
  /// The [json] parameter must not be null.
  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
