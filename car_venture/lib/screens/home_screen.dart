import 'package:car_venture/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vehicle_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehículos Disponibles")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('vehicles')
            .where('available', isEqualTo: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          var vehicles = snapshot.data!.docs
              .map((doc) => Vehicle.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text("${vehicles[index].brand} ${vehicles[index].model}"),
                subtitle: Text("\$${vehicles[index].pricePerDay} por día"),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.vehicleDetail,
                      arguments: vehicles[index]);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addVehicle);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
