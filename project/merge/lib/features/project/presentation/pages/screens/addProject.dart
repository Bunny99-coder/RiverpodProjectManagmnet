import 'package:flutter/material.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'adminProjects.dart';

class AddProjectForm extends StatefulWidget {
  const AddProjectForm({super.key});

  @override
  State<AddProjectForm> createState() => _AddProjectFormState();
}

class _AddProjectFormState extends State<AddProjectForm> {
  List<String> specializations = ["Front End", "Back End", "Mobile"];
  List<String> techStacks = [
    "React.js",
    "Angular",
    "Vue.js",
    "Node.js",
    "Express.js",
    "Django (Python)",
    "React Native",
    "Flutter",
    "Swift (iOS)"
  ];
  String? selectedSpecialization;
  String? selectedTechStack;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _addButtonPressed() {
    // Navigate to the review page
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProjectScreen()), // Navigate to the review page
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> formFields = [
      TextFormField(
        decoration: const InputDecoration(
            labelText: "Project Name",
            prefixIcon: Icon(
              Icons.computer,
              color: Color.fromRGBO(83, 92, 145, 1),
            ),
            border: OutlineInputBorder()),
      ),
      TextFormField(
        maxLines: null,
        decoration: const InputDecoration(
            labelText: "Project Description",
            prefixIcon: Icon(
              Icons.info,
              color: Color.fromRGBO(83, 92, 145, 1),
            ),
            border: OutlineInputBorder()),
      ),
      DropdownButtonFormField(
        value: selectedSpecialization,
        onChanged: (newValue) {
          setState(() {
            selectedSpecialization = newValue;
          });
        },
        items: specializations
            .map((String specialization) => DropdownMenuItem<String>(
                value: specialization, child: Text(specialization)))
            .toList(),
        decoration: const InputDecoration(
            labelText: "Select Specialization",
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.settings,
              color: Color.fromRGBO(83, 92, 145, 1),
            )),
      ),
      DropdownButtonFormField(
        value: selectedTechStack,
        onChanged: (newValue) {
          setState(() {
            selectedTechStack = newValue;
          });
        },
        items: techStacks
            .map((String techStack) => DropdownMenuItem<String>(
                value: techStack, child: Text(techStack)))
            .toList(),
        decoration: const InputDecoration(
            labelText: "Select Tech Stack",
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.code,
              color: Color.fromRGBO(83, 92, 145, 1),
            )),
      ),
      ListTile(
        title: const Text("Application Deadline"),
        subtitle: Text(selectedDate == null
            ? 'Select Date'
            : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
        leading: const Icon(
          Icons.calendar_today,
          color: Color.fromRGBO(83, 92, 145, 1),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(width: 0.67, color: Colors.black)),
        onTap: () => _selectDate(context),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            labelText: "Intake Number",
            prefixIcon: Icon(
              Icons.people,
              color: Color.fromRGBO(83, 92, 145, 1),
            ),
            border: OutlineInputBorder()),
      ),
      TextFormField(
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            labelText: "Project Duration in Days",
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Color.fromRGBO(83, 92, 145, 1),
            ),
            border: OutlineInputBorder()),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Add Project"), centerTitle: true),
      body: AppForm(
        formFields: formFields,
        sectionHeaderTitle: "Add Project",
        sectionHeaderSubtitle: "Add Project details in the form below",
        sectionHeaderIcon: const Icon(Icons.add_circle_rounded,
            color: Color.fromRGBO(83, 92, 145, 1), size: 45.0),
        buttonText: "Create Project",
        onButtonPressed: _addButtonPressed,
      ),
    );
  }
}
