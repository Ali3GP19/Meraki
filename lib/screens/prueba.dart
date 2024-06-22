import 'package:flutter/material.dart';
import 'favorites_screen.dart'; // Importa la pantalla de favoritos
import 'historial_cliente_screen.dart'; // Importa la pantalla de historial de pedidos
import 'perfil_screen.dart'; // Importa la pantalla de perfil

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast Food App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedCategory = 'Hamburguesas';

  List<Widget> _widgetOptions() {
    return <Widget>[
      HomeContent(
        selectedCategory: _selectedCategory,
        onCategorySelected: _onCategorySelected,
      ),
      FavoritesScreen(), // Usa la pantalla de favoritos importada
      ClientHistoryScreen(), // Usa la pantalla de favoritos importada
      PerfilScreen(), // Usa la pantalla de perfil importada
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Historial'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  HomeContent(
      {required this.selectedCategory, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Aquí iría la imagen del usuario
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bienvenida Mary',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '¿Qué deseas comer hoy?',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Busca tu producto',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0), // Añadido espaciado aquí
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Productos Definidos',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryTab(
                        title: 'Hamburguesas',
                        isActive: selectedCategory == 'Hamburguesas',
                        onTap: () => onCategorySelected('Hamburguesas')),
                    CategoryTab(
                        title: 'Pizzas',
                        isActive: selectedCategory == 'Pizzas',
                        onTap: () => onCategorySelected('Pizzas')),
                    CategoryTab(
                        title: 'Pollo',
                        isActive: selectedCategory == 'Pollo',
                        onTap: () => onCategorySelected('Pollo')),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.0), // Añadido espaciado aquí
          ProductList(category: selectedCategory),
          SizedBox(height: 32.0), // Añadido espaciado aquí
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalizar',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomizationOption(
                    icon: Icons.fastfood,
                    title: 'Hamburguesa',
                    option: 'Elegir Opción'),
                CustomizationOption(
                    icon: Icons.local_pizza,
                    title: 'Pizza',
                    option: 'Elegir Opción'),
                CustomizationOption(
                    icon: Icons.local_dining,
                    title: 'Pollo',
                    option: 'Elegir Opción'),
                CustomizationOption(
                    icon: Icons.local_pizza,
                    title: 'Pizza',
                    option: 'Elegir Opción'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTap;

  CategoryTab(
      {required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.teal : Colors.black,
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final String category;

  ProductList({required this.category});

  @override
  Widget build(BuildContext context) {
    List<ProductCard> products;

    switch (category) {
      case 'Pizzas':
        products = [
          ProductCard(
              name: 'Pizza Margherita',
              price: 'S/.12.50',
              image: 'assets/images/Pizza_Margherita.png'),
          ProductCard(
              name: 'Pizza Pepperoni',
              price: 'S/.15.00',
              image: 'assets/images/CHEESE-PEPPERONI.png'),
          ProductCard(
              name: 'Pizza Hawaiana',
              price: 'S/.13.50',
              image: 'assets/images/hawaiian_pizza.png'),
          ProductCard(
              name: 'Pizza BBQ',
              price: 'S/.14.50',
              image: 'assets/images/BBQ_pizza.jpg'),
        ];
        break;
      case 'Pollo':
        products = [
          ProductCard(
              name: 'Pollo Frito',
              price: 'S/.9.50',
              image: 'lib/assets/images/pollo_frito.png'),
          ProductCard(
              name: 'Pollo a la Brasa',
              price: 'S/.12.00',
              image: 'lib/assets/images/pollo_brasa.png'),
          ProductCard(
              name: 'Pollo BBQ',
              price: 'S/.10.50',
              image: 'lib/assets/images/bbq_pollo.png'),
          ProductCard(
              name: 'Pollo Asado',
              price: 'S/.11.00',
              image: 'lib/assets/images/asado._pollopng'),
        ];
        break;
      default:
        products = [
          ProductCard(
              name: 'Hamburguesa Clásica',
              price: 'S/.8.50',
              image: 'lib/assets/images/SFBClasica.jpg'),
          ProductCard(
              name: 'Hamburguesa Royal',
              price: 'S/.8.50',
              image: 'lib/assets/images/SFBCrispyChicken.jpg'),
          ProductCard(
              name: 'Hamburguesa BBQ',
              price: 'S/.8.50',
              image: 'lib/assets/images/SFBDoubleQuarterPounder.jpg'),
        ];
    }

    return Container(
      height: 240.0, // Incrementa la altura del contenedor
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  ProductCard({required this.name, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Colors.teal, // Color de fondo de la tarjeta
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // Agrega padding alrededor de la imagen
              child: Container(
                height: 80, // Ajusta la altura de la imagen
                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Color del texto
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white, // Color del texto
                    ),
                  ),
                  SizedBox(height: 5.0), // Espaciado entre el texto y el botón
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Color de fondo del botón
                      foregroundColor: Colors.teal, // Color del texto del botón
                    ),
                    onPressed: () {},
                    child: Text('Ir'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizationOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String option;

  CustomizationOption(
      {required this.icon, required this.title, required this.option});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.teal,
          ),
        ),
        onTap: () {
          // Acción al hacer clic
        },
      ),
    );
  }
}
