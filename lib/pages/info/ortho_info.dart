import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OrthopedicInfoPage extends StatefulWidget {
  const OrthopedicInfoPage({super.key});

  @override
  _OrthopedicInfoPageState createState() => _OrthopedicInfoPageState();
}

class _OrthopedicInfoPageState extends State<OrthopedicInfoPage> {
  int _currentStep = 0;

  // Example images for the carousel
  final List<String> imageUrls = [
    'asset/ortho-1.jpg',
    'asset/ortho2.jpg',
    'asset/ortho3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        title: Text.rich(TextSpan(
            style: TextStyle(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
            text: 'Orthopedic',
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
        title: Text('Common Orthopedic Conditions'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Osteoarthritis',
              'A degenerative joint disease causing pain, swelling, and stiffness in joints, often in the knees, hips, and hands.',
            ),
            _buildListItem(
              'Osteoporosis',
              'A condition where bones become weak and brittle, increasing the risk of fractures.',
            ),
            _buildListItem(
              'Fractures',
              'Broken bones caused by trauma or conditions like osteoporosis. Treatment often includes immobilization or surgery.',
            ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Bone & Joint Health Tips'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Calcium-Rich Diet',
              'Include dairy products, leafy greens, and fortified foods to maintain strong bones.',
            ),
            _buildListItem(
              'Weight-Bearing Exercises',
              'Activities like walking, running, or resistance training help strengthen bones and improve joint health.',
            ),
            _buildListItem(
              'Maintain Healthy Posture',
              'Proper posture reduces stress on the spine and joints, preventing issues over time.',
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Orthopedic-Specific Dietary Guidelines'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListItem(
              'Vitamin D',
              'Helps the body absorb calcium. Include foods like fatty fish, eggs, and fortified milk, or get exposure to sunlight.',
            ),
            _buildListItem(
              'Magnesium and Zinc',
              'These minerals are essential for bone health. Found in nuts, seeds, whole grains, and legumes.',
            ),
            _buildListItem(
              'Avoid Excess Salt',
              'Too much salt can lead to calcium loss in the bones, weakening them over time.',
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
