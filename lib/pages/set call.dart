import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital {
  final String name;
  final String phoneNumber;
  final String facebookLink;
  final List<String> images;

  Hospital({
    required this.name,
    required this.phoneNumber,
    required this.facebookLink,
    this.images = const [],
  });
}

class HospitalListScreen extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: 'Cumilla General Hospital',
      phoneNumber: '01730-324769',
      facebookLink: 'https://www.facebook.com/cumillageneralhospital',
    ),
    Hospital(
      name: 'Cumilla Medical College Hospital',
      phoneNumber: '01769957089',
      facebookLink: 'https://www.facebook.com/cmchhospital',
    ),
    // Add more hospitals here
  ];

   HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0,
        title: Text('Hospitals'),
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Implement search functionality here
          },
        ),
      ),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          final hospital = hospitals[index];
          return ListTile(
            title: Text(hospital.name),
            subtitle: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse('tel:${hospital.phoneNumber}'))) {
                      await launchUrl(Uri.parse('tel:${hospital.phoneNumber}'));
                    } else {
                      // Handle the case where the call cannot be launched
                      print('Could not launch phone call.');
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(hospital.facebookLink))) {
                      await launchUrl(Uri.parse(hospital.facebookLink));
                    } else {
                      // Handle the case where the URL cannot be launched
                      print('Could not launch URL.');
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}