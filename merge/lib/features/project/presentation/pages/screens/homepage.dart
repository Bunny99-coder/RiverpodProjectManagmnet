import 'package:flutter/material.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensure the container takes full width
        height: double.infinity, // Ensure the container takes full height
        color: Color.fromRGBO(238, 238, 238, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/HOME1.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to project hub and Free Project Application Platform!',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                text: 'Log in',
                backgroundColor: Color.fromRGBO(83, 92, 145, 1),
                textColor: Colors.white,
              ),
              SizedBox(height: 10),
              CustomElevatedButton(
                onPressed: () {
                  context.go('/adminProjects');
                },
                text: 'Log in as admin',
                backgroundColor: Color.fromRGBO(83, 92, 145, 1),
                textColor: Colors.white,
              ),
              SizedBox(height: 20), // Add bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
