import 'package:flutter/material.dart';

class PersonalizarHamburguesaScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<PersonalizarHamburguesaScreen> {
  Map<String, int> ingredientQuantities = {
    'Ingrediente 1': 1,
    'Ingrediente 2': 3,
    'Ingrediente 3': 0,
    'Ingrediente 4': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/assets/images/burger.jpg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HAMBURGUESA',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Por favor, ingresa los ingredientes que quieres agregar a tu producto:',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16.0),
                  DataTable(
                    columnSpacing: 60.0,
                    columns: [
                      DataColumn(label: Text('INGREDIENTE')),
                      DataColumn(label: Text('PRECIO')),
                      DataColumn(label: Text('CANTIDAD')),
                    ],
                    rows: ingredientQuantities.keys.map((ingredient) {
                      return DataRow(
                        cells: [
                          DataCell(Text(ingredient)),
                          DataCell(Text(
                              'S/. ${_getIngredientPrice(ingredient).toStringAsFixed(2)}')),
                          DataCell(_buildQuantityControls(ingredient)),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: S/. 10.52',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Aquí iría la lógica para registrar el producto
                        },
                        child: Text('Siguiente'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 24.0),
                          textStyle: TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getIngredientPrice(String ingredient) {
    switch (ingredient) {
      case 'Ingrediente 1':
        return 2.52;
      case 'Ingrediente 2':
        return 1.00;
      case 'Ingrediente 3':
        return 1.50;
      case 'Ingrediente 4':
        return 2.00;
      default:
        return 0.00;
    }
  }

  Widget _buildQuantityControls(String ingredient) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (ingredientQuantities[ingredient]! > 0) {
                ingredientQuantities[ingredient] =
                    ingredientQuantities[ingredient]! - 1;
              }
            });
          },
        ),
        Text(ingredientQuantities[ingredient]!.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              ingredientQuantities[ingredient] =
                  ingredientQuantities[ingredient]! + 1;
            });
          },
        ),
      ],
    );
  }
}
