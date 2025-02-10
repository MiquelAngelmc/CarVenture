import 'package:flutter/material.dart';
import '../services/vehicle_service.dart';
import '../models/vehicle_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();
  final _priceController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _submitVehicle() {
    if (_brandController.text.isEmpty ||
        _modelController.text.isEmpty ||
        _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Todos los campos son obligatorios')));
      return;
    }

    final vehicle = Vehicle(
      id: DateTime.now().toString(),
      ownerId: '123', // Se obtendría del usuario autenticado
      brand: _brandController.text,
      model: _modelController.text,
      imageUrl:
          _image?.path ?? '', // Implementar subida de imagen a Firebase Storage
      pricePerDay: double.parse(_priceController.text),
      rating: 0.0,
    );

    VehicleService().addVehicle(vehicle as Map<String, dynamic>);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Añadir Vehículo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _brandController,
                decoration: InputDecoration(labelText: 'Marca')),
            TextField(
                controller: _modelController,
                decoration: InputDecoration(labelText: 'Modelo')),
            TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Precio por día'),
                keyboardType: TextInputType.number),
            SizedBox(height: 10),
            _image != null
                ? Image.file(_image!, height: 100)
                : TextButton.icon(
                    icon: Icon(Icons.image),
                    label: Text('Subir Imagen'),
                    onPressed: _pickImage,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitVehicle,
              child: Text('Publicar Vehículo'),
            ),
          ],
        ),
      ),
    );
  }
}
