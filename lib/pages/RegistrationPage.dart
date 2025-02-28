import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_managment_system/pages/user%20account.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegistrationPage> {
  final TextEditingController user = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  Future<void> register() async {
    var uri = Uri.parse("http://192.168.0.109/authentication/register.php");
    var response = await http.post(uri, body: {
      "username": user.text,
      "email": email.text,
      "password": pass.text,
    });

    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      if (data == "Error") {
        Fluttertoast.showToast(
          msg: "This user already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Registration successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Failed to register. Please try again.",
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
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Back Icon
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.lightBlue[500],
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       padding: const EdgeInsets.all(12),
              //       child: const Icon(Icons.arrow_back),
              //     ),
              //     // Info Icon
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.lightBlue[500],
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       padding: const EdgeInsets.all(12),
              //       child: const Icon(Icons.info),
              //     ),
              //   ],
              // ),
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
              // Registration Form Section
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // Full Name Field
                        TextFormField(
                          controller: user,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Full Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // Email Field
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Register Button
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              register();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          child: const Text("Register"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 50),
                          child: Row(
                            children: [
                              Text(
                                "If you have an Account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserAccount()),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    // backgroundColor: Colors.blue,
                                    // background: Colors.blueAccent
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 50, left: 50, right: 50),
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // if (formKey.currentState!.validate()) {
                        //       //   register();
                        //       // }
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       minimumSize: const Size.fromHeight(50),
                        //     ),
                        //     child: const Text("Login"),
                        //   ),
                        // ),
                      ],
                    ),
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
