import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  void _addVehicle() {
    if (brandController.text.isEmpty ||
        modelController.text.isEmpty ||
        priceController.text.isEmpty ||
        imageUrlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Por favor, completa todos los campos")),
      );
      return;
    }

    FirebaseFirestore.instance.collection('vehicles').add({
      'brand': brandController.text,
      'model': modelController.text,
      'pricePerDay': double.parse(priceController.text),
      'imageUrl': imageUrlController.text,
      'available': true,
    });

    Navigator.pop(context); // Vuelve a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Publicar Vehículo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: brandController,
              decoration: InputDecoration(labelText: "Marca"),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: "Modelo"),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Precio por día"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: "URL de la imagen"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addVehicle,
              child: Text("Publicar"),
            ),
          ],
        ),
      ),
    );
  }
}
