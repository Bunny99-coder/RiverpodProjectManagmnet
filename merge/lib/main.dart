import 'package:flutter/material.dart';
import 'features/project/presentation/pages/screens/homepage.dart';
import 'features/project/presentation/widget/reusableWidgets.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SafeArea(
        child: PageView(
          children: [
            _buildPage(
              'View and track your projects here',
              'Get started',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            // Add more pages here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String text, String buttonText, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0), // Add bottom padding
      child: Container(
        width: double.infinity, // Ensure the container takes full width
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1, // Set flex to 1 to take half of the available space
              child: Image.asset(
                'assets/onboard.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(83, 92, 145, 1)),
                minimumSize: MaterialStateProperty.all(
                    Size(20, 40)), // Adjust button size
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/////////////