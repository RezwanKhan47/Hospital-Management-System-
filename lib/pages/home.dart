import 'package:flutter/material.dart';
import 'package:hospital_managment_system/pages/account.dart';
import 'package:hospital_managment_system/pages/help.dart';
// import 'package:hospital_managment_system/pages/hospital.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0;
  List<Widget> widgetList = [
    Help(),
    Account(
      userInfo: {},
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'MediCare',
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            blurRadius: 1,
                            color: Colors.black12,
                            offset: Offset(2, 1))
                      ],
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[300]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: Image.asset(
                  'asset/freepik__expand__51141.png',
                  height: 80,
                  width: 80,
                ),
              )
            ],
          ),
          PreferredSize(
              preferredSize: Size(5, 100),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(35),
                    child: Container(
                      height: 45,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan[100]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.green,
                            ),
                            hintText: 'Search'),
                      ),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Choose Option',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(1, 2))
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/hospital');
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'asset/hospital1.jpeg',
                      height: 200,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/demo_uploadImage');
                },
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'asset/doctor.jpeg',
                      height: 200,
                      width: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              'Categories',
              style: TextStyle(
                shadows: [
                  Shadow(
                      blurRadius: 2,
                      color: Colors.black12,
                      offset: Offset(1, 2))
                ],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: 150,
            // color: Colors.grey[200],
            // decoration: BoxDecoration(boxShadow: [
            //   BoxShadow(
            //       blurRadius: 30,
            //       spreadRadius: -5,
            //       color: Colors.grey.shade400,
            //       offset: Offset(10, 10))
            // ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/neurologist');
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/brain.jpeg',
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/orthopedic');
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/broken_bone.jpeg',
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cardiologists');
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/heart.jpeg',
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/hematologist');
                    },
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'asset/blood.jpeg',
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                // FloatingActionButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/upload');
                //   },
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Information',
              style: TextStyle(
                  shadows: [
                    Shadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(1, 2))
                  ],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
          Opacity(
            opacity: .8,
            child: SizedBox(
              height: 250,
              width: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(alignment: Alignment.center, children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/neru_info');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: Image.asset(
                              'asset/neurology_brain.jpg',
                              height: 250,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Neurologist",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white54,
                              color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(alignment: Alignment.center, children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/ortho_info');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: Image.asset(
                              'asset/orthopedic .jpg',
                              height: 250,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Orthopedic",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white54,
                              color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(alignment: Alignment.center, children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/cardio_info');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: Image.asset(
                              'asset/cardiology.jpg',
                              height: 250,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Cardiologists",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white54,
                              color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(alignment: Alignment.center, children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/hemato_info');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          shadowColor: Colors.blueAccent,
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            child: Image.asset(
                              'asset/blood.jpg',
                              height: 250,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Hematologist",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white54,
                              color: Colors.white),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
