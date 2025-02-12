class VehicleService {
  List<Map<String, String>> vehicles = [
    {
      'id': '1',
      'name': 'Toyota Corolla',
      'type': 'Car',
      'price': '30',
    },
    {
      'id': '2',
      'name': 'Yamaha R1',
      'type': 'Bike',
      'price': '50',
    },
    {
      'id': '3',
      'name': 'Audi A3',
      'type': 'Car',
      'price': '60',
    },
  ];

  // Simulando la carga de vehículos
  Stream<List<Map<String, String>>> getAllVehicles() async* {
    await Future.delayed(Duration(seconds: 2)); // Simulando la carga de datos
    yield vehicles;
  }

  // Simulando la creación de un alquiler
  Future<void> createRental(Map<String, dynamic> rentalData) async {
    // Aquí podrías agregar lógica para guardar el alquiler en una base de datos local o simulada
    print('Alquiler creado: $rentalData');
  }
}
