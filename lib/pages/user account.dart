import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http; // Missing import
import 'package:hospital_managment_system/pages/navigator_page.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  Future<void> userLogin() async {
    var uri = Uri.parse(
        "http://192.168.0.109/authentication/login.php"); // Changed endpoint for login
    try {
      var response = await http.post(uri, body: {
        "email": email.text,
        "password": pass.text,
      });

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data == "Success") {
          Fluttertoast.showToast(
            msg: "Login successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigatorPage()),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Account(
          //       userInfo: data['user'], // Pass user data to AccountPage
          //     ),
          //   ),
          // );
        } else {
          Fluttertoast.showToast(
            msg: "Email & password incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Server error. Please try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Network error. Please check your connection.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Image Section
              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(110),
                    child: const Image(
                      image: AssetImage('asset/freepik__expand__51141.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // User Details Form Section
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: email,
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Password Field
                      TextFormField(
                        controller: pass,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (email.text.isEmpty || pass.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: "Please fill in all fields",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          } else {
                            userLogin();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
