// Import statements
import 'package:flutter/material.dart';
import 'signuppage.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'projects.dart'; // Import the projects page

// Login Page Widget
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(
          238, 238, 238, 1), // Background color for the whole screen
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Color.fromRGBO(83, 92, 145, 1),
                padding: EdgeInsets.all(
                    20.0), // Add horizontal padding for alignment
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context)
                            .padding
                            .top), // Adjust top padding for status bar
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            Navigator.pop(
                                context); // Navigate back to previous screen
                          },
                        ),
                        SizedBox(
                            width:
                                20), // Adjust spacing between back icon and login text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Log in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Welcome',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InputFieldWidget(
                      hintText: 'Email Address',
                    ),
                    SizedBox(height: 10),
                    InputFieldWidget(
                      hintText: 'Password',
                    ),
                    SizedBox(height: 20),
                    SubmitButtonWidget(
                      text: 'Log in',
                      onPressed: () {
                        print('Log in button pressed!');
                        // Navigate to the projects page when the login button is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectScreen2()),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    NavigationRowWidget(
                      text: "don't have Account?",
                      actionText: ' sign up',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButtonWidget(
                          icon: Icons.g_translate,
                          onPressed: () {
                            print('Google button pressed!');
                          },
                        ),
                        SocialMediaButtonWidget(
                          icon: Icons.facebook,
                          onPressed: () {
                            print('Facebook button pressed!');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
