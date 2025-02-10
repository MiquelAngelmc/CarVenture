import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Iniciar Sesión", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Correo Electrónico"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                var user = await Provider.of<AuthService>(context, listen: false)
                    .loginWithEmail(email, password);
                if (user != null) {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                }
              },
              child: Text("Ingresar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addVehicle);
              },
              child: Text("¿No tienes cuenta? Regístrate"),
            ),
          ],
        ),
      ),
    );
  }
}
