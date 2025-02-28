import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HematologyInfoPage extends StatefulWidget {
  const HematologyInfoPage({super.key});

  @override
  _HematologyInfoPageState createState() => _HematologyInfoPageState();
}

class _HematologyInfoPageState extends State<HematologyInfoPage> {
  int _currentStep = 0;

  // Example images for the carousel
  final List<String> imageUrls = [
    'asset/hemato1.jpg',
    'asset/hemato2.jpg',
    'asset/hemato3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent,
        title: Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 25,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold),
            text: 'Hematology',
            children: [
              TextSpan(
                  text: ' Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.cyan[300]))
            ])),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            // Carousel Slider at the top
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
                viewportFraction: 0.8,
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: Stepper(
                type: StepperType
                    .vertical, // Vertical layout for better readability
                currentStep: _currentStep,
                onStepTapped: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                controlsBuilder: (context, details) =>
                    SizedBox.shrink(), // Hide buttons
                steps: _steps(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> _steps() {
    return [
      Step(
        title: Text('Common Hematological Conditions'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Anemia',
              'A condition where there are insufficient healthy red blood cells to carry oxygen to the body’s tissues. Symptoms include fatigue, weakness, and pale skin.',
            ),
            _buildListItem(
              'Leukemia',
              'A type of blood cancer that affects the white blood cells. Symptoms include fever, frequent infections, and fatigue.',
            ),
            _buildListItem(
              'Hemophilia',
              'A genetic disorder where blood does not clot properly, leading to excessive bleeding from minor injuries.',
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Blood Health Tips'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Iron-Rich Diet',
              'Consume foods like spinach, lentils, and red meat to maintain healthy red blood cell production.',
            ),
            _buildListItem(
              'Hydration',
              'Drink plenty of water to keep your blood fluid and maintain proper circulation.',
            ),
            _buildListItem(
              'Regular Exercise',
              'Engage in activities like walking, jogging, or swimming to improve blood circulation and overall health.',
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Hematology-Specific Dietary Guidelines'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Vitamin B12',
              'Essential for red blood cell production. Found in eggs, dairy products, and fortified cereals.',
            ),
            _buildListItem(
              'Folate (Vitamin B9)',
              'Important for DNA synthesis and red blood cell production. Found in leafy greens, oranges, and beans.',
            ),
            _buildListItem(
              'Avoid Excessive Alcohol',
              'Excessive alcohol can negatively affect bone marrow and blood cell production.',
            ),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
    ];
  }

  Widget _buildListItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
