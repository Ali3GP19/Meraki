import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/personaliza_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/historial_cliente_screen.dart';
import 'screens/perfil_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meraki Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/product_details': (context) => ProductDetailsScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/history_Client': (context) => ClientHistoryScreen(),
        '/perfil': (context) => PerfilScreen(),
      },
    );
  }
}
