import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>) onRemoveItem;

  const CartPage({super.key, required this.cartItems, required this.onRemoveItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 25,
                color: Colors.blueAccent[200],
                fontWeight: FontWeight.bold),
            text: 'Appointment',
            children: [
              TextSpan(
                  text: ' List',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.cyan[300]))
            ])),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Appointment list is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      "http://192.168.0.109/image_upload_php_mysql/uploads/${item['image']}",
                    ),
                    title: Text(item['name']),
                    subtitle: Text("Department: ${item['department']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle,
                          color: Colors.redAccent[400]),
                      onPressed: () {
                        onRemoveItem(item); // Remove item from the cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '${item['name']} removed from Appointment list')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
