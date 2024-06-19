import 'package:flutter/material.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'applicationForm.dart'; // Import the ApplicationForm page
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

class ProjectDetail2 extends StatelessWidget {
  final Project project;

  ProjectDetail2(this.project);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle project click
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: double.infinity,
                      child: Image.network(
                        project.imageUrl,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            project.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildListItem('Deadline:', project.deadline),
              _buildListItem('Description:', project.description),
              _buildListItem('Requirement:', project.Requirment),
              _buildListItem('Language:', project.language),
              _buildListItem('Application:', project.application),
              _buildListItem('Intake:', project.intake),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the application form page when the "Apply" button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplicationForm()),
                  );
                },
                child: Text('Apply'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(83, 92, 145, 1),
                  foregroundColor: Color.fromRGBO(238, 238, 238, 1),
                  textStyle: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  text,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
