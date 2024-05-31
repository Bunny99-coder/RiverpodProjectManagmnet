import 'package:flutter/material.dart';

void main() {
  runApp(UserProfileApp());
}

class UserProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
          238, 238, 238, 1), // Background color for the whole screen
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Color.fromRGBO(
                  83, 92, 145, 1), // Background color for the header
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 20,
                  right: 20,
                  bottom: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.white), // Back icon
                    onPressed: () {
                      Navigator.pop(
                          context); // Navigate back to previous screen
                    },
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Edit Your Profile',
                      textAlign: TextAlign.center, // Align text to the center
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromRGBO(
                  83, 92, 145, 1), // Background color for the avatar container
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email', // Placeholder text
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print('Edit button pressed!');
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Button text color
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(83, 92, 145, 1), // Button color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
