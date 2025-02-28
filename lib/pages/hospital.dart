import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospital extends StatelessWidget {
  const Hospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[100],
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.settings, color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image2.jpg'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search',
            //     prefixIcon: Icon(Icons.search),
            //     fillColor: Colors.white,
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              'Hospitals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildHospitalCard(
                    name: 'Cumilla General Hospital',
                    rating: 5,
                    phoneNumber: '01730-324769',
                    facebookLink:
                        'https://www.facebook.com/comillaghc.dghs.gov.bd/?locale=bn_IN',
                  ),
                  _buildHospitalCard(
                    name: 'Cumilla Medical College Hospital',
                    rating: 5,
                    phoneNumber: '01769957089',
                    facebookLink:
                        'https://www.facebook.com/p/Cumilla-Medical-College-Hospital-100086636172251/',
                  ),
                  _buildHospitalCard(
                    name: 'Moon Hospital Limited',
                    rating: 4,
                    phoneNumber: '01766556655',
                    facebookLink:
                        'https://www.facebook.com/p/Comilla-Moon-Hospital-100079477045876/',
                  ),
                  _buildHospitalCard(
                    name: 'Modern Hospital',
                    rating: 3,
                    phoneNumber: '01711785199',
                    facebookLink:
                        'https://www.facebook.com/MODERN.01711785199/?locale=bn_IN',
                  ),
                  _buildHospitalCard(
                    name: 'Popular Hospital',
                    rating: 3,
                    phoneNumber: '01711785442',
                    facebookLink:
                        'https://www.facebook.com/cumillapopularhospital/?locale=bn_IN',
                  ),
                  _buildHospitalCard(
                    name: 'Comilla Trauma Centre',
                    rating: 5,
                    phoneNumber: '01735274020',
                    facebookLink:
                        'https://www.facebook.com/comillatraumacenter/',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalCard({
    required String name,
    required int rating,
    String? phoneNumber,
    String? facebookLink,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            );
          }),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (phoneNumber != null)
              IconButton(
                icon: Icon(Icons.phone, color: Colors.blue),
                onPressed: () async {
                  final Uri phoneUri = Uri.parse('tel:$phoneNumber');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  } else {
                    print('Could not launch phone call');
                  }
                },
              ),
            if (facebookLink != null)
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.blue),
                onPressed: () async {
                  final Uri facebookUri = Uri.parse(facebookLink);
                  if (await canLaunchUrl(facebookUri)) {
                    await launchUrl(facebookUri);
                  } else {
                    print('Could not launch Facebook page');
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
