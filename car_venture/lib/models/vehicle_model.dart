class Vehicle {
  final String id;
  final String ownerId;
  final String brand;
  final String model;
  final String imageUrl;
  final double pricePerDay;
  final double rating;

  Vehicle({
    required this.id,
    required this.ownerId,
    required this.brand,
    required this.model,
    required this.imageUrl,
    required this.pricePerDay,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerId': ownerId,
      'brand': brand,
      'model': model,
      'imageUrl': imageUrl,
      'pricePerDay': pricePerDay,
      'rating': rating,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'],
      ownerId: map['ownerId'],
      brand: map['brand'],
      model: map['model'],
      imageUrl: map['imageUrl'],
      pricePerDay: map['pricePerDay'],
      rating: map['rating'],
    );
  }
}
