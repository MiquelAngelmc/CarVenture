import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleService {
  final CollectionReference vehiclesCollection =
      FirebaseFirestore.instance.collection('vehicles');

  Future<void> addVehicle(Map<String, dynamic> vehicleData) async {
    try {
      await vehiclesCollection.add(vehicleData);
    } catch (e) {
      throw Exception('Error al agregar vehículo: $e');
    }
  }

  Stream<QuerySnapshot> getVehicles() {
    return vehiclesCollection.snapshots();
  }

  Future<void> deleteVehicle(String vehicleId) async {
    try {
      await vehiclesCollection.doc(vehicleId).delete();
    } catch (e) {
      throw Exception('Error al eliminar vehículo: $e');
    }
  }
}
