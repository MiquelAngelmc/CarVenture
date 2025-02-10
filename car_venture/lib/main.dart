import 'package:car_venture/screens/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
      debugShowCheckedModeBanner: false, // Oculta el banner de "Debug"
      title: 'Rent A Car',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color principal
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.login, // Pantalla inicial
      routes: AppRoutes.getRoutes(), // Definir rutas
    );
  }
}
