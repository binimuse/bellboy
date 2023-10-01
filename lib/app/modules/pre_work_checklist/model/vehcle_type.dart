class VehicleType {
  final String name;
  final String image;
  final String date;

  VehicleType({required this.name, required this.image, required this.date});

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
