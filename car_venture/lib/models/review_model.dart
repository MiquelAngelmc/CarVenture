class Review {
  final String id;
  final String userId;
  final String vehicleId;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.rating,
    required this.comment,
    required this.date,
  });

  // Convertir a Map para Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'vehicleId': vehicleId,
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }

  // Crear instancia desde Firestore
  factory Review.fromMap(String id, Map<String, dynamic> map) {
    return Review(
      id: id,
      userId: map['userId'],
      vehicleId: map['vehicleId'],
      rating: map['rating'].toDouble(),
      comment: map['comment'],
      date: DateTime.parse(map['date']),
    );
  }
}
