import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  // Simulated favorite products data
  final List<Map<String, dynamic>> favoriteProducts = [
    {
      'name': 'Hamburguesa Crispy Chicken',
      'image': 'lib/assets/images/SFBCrispyChicken.jpg',
      'price': 12.99,
    },
    {
      'name': 'Pizza Americana',
      'image': 'lib/assets/images/Pizza_Margherita.png',
      'price': 42.99,
    },
    {
      'name': 'Hamburguesa Royal',
      'image': 'lib/assets/images/pizza.jpg',
      'price': 35.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos Favoritos'),
        centerTitle: true, // Centra el título en la AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Dos columnas
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75, // Relación de aspecto para las tarjetas
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            return ProductCard(
              name: favoriteProducts[index]['name'],
              image: favoriteProducts[index]['image'],
              price: favoriteProducts[index]['price'],
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ProductCard({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              image,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1, // Máximo de líneas para el nombre del producto
                  overflow: TextOverflow.ellipsis, // Manejo de desbordamiento
                ),
                SizedBox(height: 4),
                Text(
                  'S/. ${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
