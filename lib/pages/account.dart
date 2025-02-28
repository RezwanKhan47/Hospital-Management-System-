import 'package:flutter/material.dart';
import 'package:hospital_managment_system/pages/user%20account.dart';

class Account extends StatelessWidget {
  final Map<String, dynamic> userInfo;

  const Account({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, ${userInfo['name']}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Email: ${userInfo['email']}",
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => UserAccount()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.red,
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
