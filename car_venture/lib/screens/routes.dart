import 'package:car_venture/screens/add_vehicle_screen.dart';
import 'package:car_venture/screens/booking_screen.dart';
import 'package:car_venture/screens/home_screen.dart';
import 'package:car_venture/screens/login_screen.dart';
import 'package:car_venture/screens/register_screen.dart';
import 'package:car_venture/screens/vehicle_detail_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register'; // Añadimos esta ruta

  static const String home = '/home';
  static const String vehicleDetail = '/vehicleDetail';
  static const String addVehicle = '/addVehicle';
  static const String booking = '/booking';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      register: (context) =>
          RegisterScreen(), // Asegúrate de que esta ruta esté definida

      home: (context) => HomeScreen(),
      vehicleDetail: (context) => VehicleDetailScreen(),
      addVehicle: (context) => AddVehicleScreen(),
      booking: (context) => BookingScreen(),
    };
  }
}
