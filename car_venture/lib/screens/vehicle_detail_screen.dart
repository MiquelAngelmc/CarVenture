import 'package:flutter/material.dart';
import '../models/vehicle_model.dart';

class VehicleDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Vehicle vehicle =
        ModalRoute.of(context)!.settings.arguments as Vehicle;

    return Scaffold(
      appBar: AppBar(title: Text("${vehicle.brand} ${vehicle.model}")),
      body: Column(
        children: [
          Image.network(vehicle.imageUrl,
              height: 200, width: double.infinity, fit: BoxFit.cover),
          Text("${vehicle.brand} ${vehicle.model}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("\$${vehicle.pricePerDay} por día"),
          ElevatedButton(
            onPressed: () {
              // Aquí irá la lógica de alquiler
            },
            child: Text("Alquilar Ahora"),
          ),
        ],
      ),
    );
  }
}
