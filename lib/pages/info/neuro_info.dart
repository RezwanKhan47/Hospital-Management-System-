import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NeurologyInfoPage extends StatefulWidget {
  const NeurologyInfoPage({super.key});

  @override
  _NeurologyInfoPageState createState() => _NeurologyInfoPageState();
}

class _NeurologyInfoPageState extends State<NeurologyInfoPage> {
  int _currentStep = 0;

  // Example images for the carousel
  final List<String> imageUrls = [
    'asset/neuro1.jpg',
    'asset/neuro2.jpg',
    'asset/neuro3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[150],
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text.rich(TextSpan(
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent[200],
                  fontWeight: FontWeight.bold),
              text: 'Neurology',
              children: [
                TextSpan(
                    text: ' Information',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.cyan[300]))
              ])),
        ),
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
        title: Text('Common Neurological Syndromes'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Parkinson\'s Disease',
              'A progressive disorder of the nervous system affecting movement. Symptoms include tremors, rigidity, and slow movement.',
            ),
            _buildListItem(
              'Stroke',
              'An interruption of blood supply to the brain. Symptoms include numbness, weakness, difficulty speaking, and confusion.',
            ),
            _buildListItem(
              'Epilepsy',
              'A condition marked by recurrent seizures. Symptoms include involuntary movements, convulsions, and loss of awareness.',
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('General Neurological Health Tips'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Healthy Lifestyle',
              'Maintain a healthy blood pressure, avoid smoking, and engage in regular exercise to enhance brain health.',
            ),
            _buildListItem(
              'Sleep',
              'Get enough sleep (7–9 hours per night) to support cognitive function and overall neurological health.',
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Neurology-Specific Dietary Guidelines'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Mediterranean Diet',
              'Includes vegetables, fruits, whole grains, lean proteins, and healthy fats like olive oil to promote brain health.',
            ),
            _buildListItem(
              'Omega-3 Fatty Acids',
              'Found in foods like salmon and walnuts, omega-3s help reduce inflammation and support brain function.',
            ),
            _buildListItem(
              'For Epilepsy Patients',
              'A ketogenic diet, which is high in fat and low in carbohydrates, may help reduce seizure frequency.',
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
