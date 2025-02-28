import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  final List<Map<String, dynamic>> ambulanceDrivers = [
    {
      'name': 'Shahin',
      'contact': '01863233194',
      'rating': 4.5,
      'image': 'asset/shapu.jpg',
    },
    {
      'name': 'Jon Smith',
      'contact': '01711074399',
      'rating': 4.8,
      'image': 'asset/RKhan.jpeg',
    },
    {
      'name': 'Michael Maliha',
      'contact': '01883420255',
      'rating': 4.2,
      'image': 'asset/Malu.jpg',
    },
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        title: Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent[200],
                fontWeight: FontWeight.bold),
            text: 'Ambulance',
            children: [
              TextSpan(
                  text: ' Service',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue[200]))
            ])),
      ),
      body: ListView.builder(
        itemCount: ambulanceDrivers.length,
        itemBuilder: (context, index) {
          final driver = ambulanceDrivers[index];

          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(driver['image']),
              ),
              title: Text(
                driver['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.green),
                      const SizedBox(width: 5),
                      Text(driver['contact']),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text('${driver['rating']}'),
                    ],
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () => _makePhoneCall(driver['contact']),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Call'),
              ),
            ),
          );
        },
      ),
    );
  }
}
