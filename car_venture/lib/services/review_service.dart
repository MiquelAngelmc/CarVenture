import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService {
  final CollectionReference reviewsCollection =
      FirebaseFirestore.instance.collection('reviews');

  Future<void> addReview(Map<String, dynamic> reviewData) async {
    try {
      await reviewsCollection.add(reviewData);
    } catch (e) {
      throw Exception('Error al agregar reseña: $e');
    }
  }

  Stream<QuerySnapshot> getReviews(String vehicleId) {
    return reviewsCollection
        .where('vehicleId', isEqualTo: vehicleId)
        .snapshots();
  }
}
