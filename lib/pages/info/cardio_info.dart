import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardiologyInfoPage extends StatefulWidget {
  const CardiologyInfoPage({super.key});

  @override
  _CardiologyInfoPageState createState() => _CardiologyInfoPageState();
}

class _CardiologyInfoPageState extends State<CardiologyInfoPage> {
  int _currentStep = 0;

  // Example images for the carousel
  final List<String> imageUrls = [
    'asset/cardio1.jpg',
    'asset/cardio2.jpg',
    'asset/cardio3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.redAccent,
        title: Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold),
            text: 'Cardiology',
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
        title: Text('Common Cardiac Conditions'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Heart Attack',
              'Occurs when blood flow to the heart is blocked, often by a blood clot. Symptoms include chest pain, shortness of breath, and nausea.',
            ),
            _buildListItem(
              'Arrhythmia',
              'Irregular heartbeat that can feel like fluttering or racing. It may lead to dizziness or fainting.',
            ),
            _buildListItem(
              'Heart Failure',
              'Occurs when the heart cannot pump enough blood to meet the body\'s needs. Symptoms include fatigue, swelling, and difficulty breathing.',
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Heart-Healthy Tips'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Balanced Diet',
              'Consume plenty of vegetables, fruits, whole grains, and lean proteins. Limit saturated fats and avoid trans fats.',
            ),
            _buildListItem(
              'Regular Exercise',
              'Engage in at least 150 minutes of moderate aerobic activity or 75 minutes of vigorous activity each week.',
            ),
            _buildListItem(
              'Stress Management',
              'Practice relaxation techniques such as deep breathing, yoga, or meditation to reduce stress and its impact on your heart.',
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Cardiology-Specific Dietary Guidelines'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Low-Sodium Diet',
              'Reduce salt intake to lower blood pressure and decrease the risk of cardiovascular disease.',
            ),
            _buildListItem(
              'Omega-3 Fatty Acids',
              'Include fatty fish like salmon and mackerel to reduce inflammation and improve heart health.',
            ),
            _buildListItem(
              'Limit Added Sugars',
              'Excess sugar can contribute to obesity, diabetes, and cardiovascular problems. Choose natural sweeteners instead.',
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
