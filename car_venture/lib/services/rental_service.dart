import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rental_history_model.dart';

class RentalService {
  final CollectionReference rentalsCollection =
      FirebaseFirestore.instance.collection('rentals');

  // Crear un nuevo alquiler
  Future<void> createRental(Map<String, dynamic> rentalData) async {
    try {
      await rentalsCollection.add(rentalData);
    } catch (e) {
      throw Exception('Error al crear alquiler: $e');
    }
  }

  // Obtener los alquileres en tiempo real de un usuario
  Stream<QuerySnapshot> getUserRentals(String userId) {
    return rentalsCollection.where('userId', isEqualTo: userId).snapshots();
  }

  // Marcar un alquiler como completado
  Future<void> completeRental(String rentalId) async {
    try {
      await rentalsCollection.doc(rentalId).update({'status': 'completed'});
    } catch (e) {
      throw Exception('Error al completar alquiler: $e');
    }
  }

  // 🔹 NUEVO: Obtener historial de alquileres (para corregir el error)
  Future<List<RentalHistory>> getRentalHistory(String userId) async {
    try {
      QuerySnapshot rentalSnapshot = await rentalsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('startDate', descending: true)
          .get();

      return rentalSnapshot.docs.map((doc) {
        return RentalHistory.fromMap(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error al obtener historial de alquileres: $e');
      return [];
    }
  }
}
