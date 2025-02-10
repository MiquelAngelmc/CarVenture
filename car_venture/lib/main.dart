import 'package:flutter/material.dart';
import 'screens/add_vehicle_screen.dart';
import 'screens/rental_history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarVenture Mallorca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/add-vehicle': (context) => AddVehicleScreen(),
        '/rental-history': (context) => RentalHistoryScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CarVenture Mallorca')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-vehicle');
              },
              child: const Text('Añadir Vehículo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/rental-history');
              },
              child: const Text('Historial de Alquiler'),
            ),
          ],
        ),
      ),
    );
  }
}
