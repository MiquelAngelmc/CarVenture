import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/vehicle_detail_screen.dart';
import 'screens/add_vehicle_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String vehicleDetail = '/vehicleDetail';
  static const String addVehicle = '/addVehicle';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      home: (context) => HomeScreen(),
      vehicleDetail: (context) => VehicleDetailScreen(),
      addVehicle: (context) => AddVehicleScreen(),
    };
  }
}