import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/vehicle_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _startDate;
  DateTime? _endDate;
  double _totalCost = 0.0;

  void _calculateCost(VehicleModel vehicle) {
    if (_startDate != null && _endDate != null) {
      int days = _endDate!.difference(_startDate!).inDays + 1;
      setState(() {
        _totalCost = days * vehicle.pricePerDay;
      });
    }
  }

  void _confirmBooking(VehicleModel vehicle) async {
    if (_formKey.currentState!.validate() && _startDate != null && _endDate != null) {
      await FirebaseFirestore.instance.collection('bookings').add({
        'vehicleId': vehicle.id,
        'brand': vehicle.brand,
        'model': vehicle.model,
        'startDate': _startDate.toString(),
        'endDate': _endDate.toString(),
        'totalCost': _totalCost,
        'status': 'confirmed',
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reserva confirmada")));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final VehicleModel vehicle = ModalRoute.of(context)!.settings.arguments as VehicleModel;

    return Scaffold(
      appBar: AppBar(title: Text("Reservar ${vehicle.brand} ${vehicle.model}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "${vehicle.brand} ${vehicle.model}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text("\$${vehicle.pricePerDay} por día"),
              SizedBox(height: 20),
              
              // Fecha de inicio
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: "Fecha de inicio"),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      _startDate = picked;
                      _calculateCost(vehicle);
                    });
                  }
                },
                validator: (value) => _startDate == null ? "Seleccione una fecha" : null,
                controller: TextEditingController(text: _startDate != null ? DateFormat('dd/MM/yyyy').format(_startDate!) : ""),
              ),
              
              // Fecha de fin
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: "Fecha de fin"),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _startDate ?? DateTime.now(),
                    firstDate: _startDate ?? DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      _endDate = picked;
                      _calculateCost(vehicle);
                    });
                  }
                },
                validator: (value) => _endDate == null ? "Seleccione una fecha" : null,
                controller: TextEditingController(text: _endDate != null ? DateFormat('dd/MM/yyyy').format(_endDate!) : ""),
              ),
              
              SizedBox(height: 20),
              Text("Costo Total: \$$_totalCost", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () => _confirmBooking(vehicle),
                child: Text("Confirmar Reserva"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
