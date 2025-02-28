import 'package:flutter/material.dart';
import 'package:hospital_managment_system/pages/RegistrationPage.dart';
import 'package:hospital_managment_system/pages/demo_uploadImage.dart';
import 'package:hospital_managment_system/pages/hospital.dart';
import 'package:hospital_managment_system/pages/info/cardio_info.dart';
import 'package:hospital_managment_system/pages/info/hemato_info.dart';
import 'package:hospital_managment_system/pages/info/neuro_info.dart';
import 'package:hospital_managment_system/pages/info/ortho_info.dart';
import 'package:hospital_managment_system/pages/slider/cardiologists.dart';
import 'package:hospital_managment_system/pages/slider/hematologist.dart';
import 'package:hospital_managment_system/pages/slider/neurologist.dart';
import 'package:hospital_managment_system/pages/slider/orthopedic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const NavigatorPage(),
      routes: {
        '/': (context) => RegistrationPage(),
        // '/doctor': (context) => DemoUploadImage(),
        '/hospital': (context) => Hospital(),
        '/demo_uploadImage': (context) => AllPersonData(),
        '/neurologist': (context) => NeurologistData(),
        '/cardiologists': (context) => CardiologistData(),
        '/orthopedic': (context) => OrthopedicData(),
        '/hematologist': (context) => HematologistData(),
        '/neru_info': (context) => NeurologyInfoPage(),
        '/cardio_info': (context) => CardiologyInfoPage(),
        '/ortho_info': (context) => OrthopedicInfoPage(),
        '/hemato_info': (context) => HematologyInfoPage(),
      },
    );
  }
}
