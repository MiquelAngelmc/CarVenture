import 'package:car_venture/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/add_vehicle_screen.dart';
import 'screens/rental_history_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarVenture Mallorca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login, // Pantalla inicial (Login)
      routes: {
        '/add-vehicle': (context) => AddVehicleScreen(),
        '/rental-history': (context) => RentalHistoryScreen(),
        ...AppRoutes.getRoutes(), // Mantiene otras rutas definidas
      },
    );
  }
}
