class RentalHistory {
  final String id;
  final String userId;
  final String vehicleId;
  final DateTime startDate;
  final DateTime endDate;
  final double totalPrice;
  final String status; // "pending", "active", "completed"

  RentalHistory({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.status,
  });

  // Convertir a Map para Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'vehicleId': vehicleId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'totalPrice': totalPrice,
      'status': status,
    };
  }

  // Crear instancia desde Firestore
  factory RentalHistory.fromMap(String id, Map<String, dynamic> map) {
    return RentalHistory(
      id: id,
      userId: map['userId'],
      vehicleId: map['vehicleId'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      totalPrice: map['totalPrice'].toDouble(),
      status: map['status'],
    );
  }

  get vehicleBrand => null;

  get rentalDate => null;

  get price => null;

  get vehicleModel => null;
}
