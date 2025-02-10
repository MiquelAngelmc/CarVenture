import 'package:car_venture/models/rental_history_model.dart';
import 'package:flutter/material.dart';
import '../services/rental_service.dart';
import '../models/rental_history_model.dart'; // Ensure this file defines the RentalHistory class

class RentalHistoryScreen extends StatefulWidget {
  @override
  _RentalHistoryScreenState createState() => _RentalHistoryScreenState();
}

class _RentalHistoryScreenState extends State<RentalHistoryScreen> {
  late Future<List<RentalHistory>> _rentalHistory;

  @override
  void initState() {
    super.initState();
    _rentalHistory =
        RentalService().getRentalHistory('123'); // ID de usuario autenticado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historial de Alquileres')),
      body: FutureBuilder<List<RentalHistory>>(
        future: _rentalHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar el historial'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay alquileres registrados.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final rental = snapshot.data![index];
              return ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('${rental.vehicleBrand} ${rental.vehicleModel}'),
                subtitle: Text(
                    'Fecha: ${rental.rentalDate} - Precio: \$${rental.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
