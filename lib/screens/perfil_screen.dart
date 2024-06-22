import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Color(0xFF008080),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Foto del Usuario
              ),
              SizedBox(height: 30),
              Text(
                'Mary Mezones',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'user@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Editar Perfil'),
                onTap: () {
                  // Agregar la interface para edición del perfil
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Cambiar Contraseña'),
                onTap: () {
                  //  Agregar la interface para el cambio de contraseña
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('Historial de Pedidos'),
                onTap: () {
                  // Redireccionar nuevamente a su interface del historial de pedidos
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Números de Contacto'),
                onTap: () {
                  // Navega a la pantalla de direcciones
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  // Acción para cerrar sesión
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
