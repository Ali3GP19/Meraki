import 'package:flutter/material.dart';

class PersonalizarProductoXScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalizar Hamburguesa'),
      ),
      body: Center(
        child: Text('Aquí puedes personalizar tu hamburguesa'),
      ),
    );
  }
}
