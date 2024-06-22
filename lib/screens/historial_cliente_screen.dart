import 'package:flutter/material.dart';

class ClientHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: Color(0xFF008080),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Order #1234'),
            subtitle: Text('Date: 01/01/2023 - Total: \$29.99'),
            onTap: () {
              // Navigate to order detail
            },
          ),
          // Add more order history items here
        ],
      ),
    );
  }
}
