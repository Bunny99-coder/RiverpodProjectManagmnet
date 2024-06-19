import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

class SignupPage extends StatelessWidget {
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
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Signup',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Create New Account',
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
                      hintText: 'Full Name',
                    ),
                    SizedBox(height: 10),
                    InputFieldWidget(
                      hintText: 'Email Address',
                    ),
                    SizedBox(height: 10),
                    InputFieldWidget(
                      hintText: 'Password',
                    ),
                    SizedBox(height: 20),
                    SubmitButtonWidget(
                      text: 'Sign up',
                      onPressed: () {
                        print('Sign up button pressed!');
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            ' Log in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
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
