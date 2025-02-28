import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../cart.dart';

class HematologistData extends StatefulWidget {
  const HematologistData({super.key});

  @override
  _HematologistDataState createState() => _HematologistDataState();
}

class _HematologistDataState extends State<HematologistData> {
  List<Map<String, dynamic>> cartItems = []; // List to store cart items

  Future<List<dynamic>> allPerson() async {
    final uri = Uri.parse(
        "http://192.168.0.109/image_upload_php_mysql/viewAll _hematologist.php");
    var response = await http.get(uri);
    return json.decode(response.body);
  }

  void addToCart(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${item['name']} added to Appointment')),
    );
  }

  void navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartItems: cartItems,
          onRemoveItem: (item) {
            setState(() {
              cartItems.remove(item);
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    allPerson();
  }

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
            text: 'Doctor',
            children: [
              TextSpan(
                  text: ' List',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.cyan[300]))
            ])),
        actions: [
          //   IconButton(
          //       icon: Icon(Icons.shopping_cart),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => DemoUploadImage(),
          //           ),
          //         );
          //       }),
          IconButton(
            icon: Icon(Icons.layers_outlined),
            color: Colors.blue,
            onPressed: navigateToCart,
          ),
        ],
      ),
      body: FutureBuilder(
        future: allPerson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    List? list = snapshot.data;
                    return Card(
                      child: ListTile(
                        title: Container(
                          decoration: BoxDecoration(color: Colors.grey[100]),
                          height: 100,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "http://192.168.0.109/image_upload_php_mysql/uploads/${list?[index]['image']}",
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Name: "),
                                        Text(list?[index]['name']),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Depart: "),
                                        Text(list?[index]['department']),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_box),
                                color: Colors.blueAccent,
                                onPressed: () => addToCart(list?[index]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// class CartPage extends StatelessWidget {
//   final List<Map<String, dynamic>> cartItems;
//   final Function(Map<String, dynamic>) onRemoveItem;
//
//   CartPage({required this.cartItems, required this.onRemoveItem});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: cartItems.isEmpty
//           ? Center(child: Text('Appointment list is empty'))
//           : ListView.builder(
//               itemCount: cartItems.length,
//               itemBuilder: (context, index) {
//                 final item = cartItems[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Image.network(
//                       "http://192.168.0.109/image_upload_php_mysql/uploads/${item['image']}",
//                     ),
//                     title: Text(item['name']),
//                     subtitle: Text("Department: ${item['department']}"),
//                     trailing: IconButton(
//                       icon: Icon(Icons.remove_circle, color: Colors.red),
//                       onPressed: () {
//                         onRemoveItem(item); // Remove item from the cart
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content: Text(
//                                   '${item['name']} removed from Appointment list')),
//                         );
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
