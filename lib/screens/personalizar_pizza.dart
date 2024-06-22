import 'package:flutter/material.dart';

class PersonalizarPizzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalizar Pizza'),
      ),
      body: Center(
        child: Text('Aquí puedes personalizar tu pizza'),
      ),
    );
  }
}
