import 'package:car_venture/add_vehicle_screen.dart';
import 'package:car_venture/screens/home_screen.dart';
import 'package:car_venture/screens/login_screen.dart';
import 'package:car_venture/screens/vehicle_detail_screen.dart';
import 'package:flutter/material.dart';


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