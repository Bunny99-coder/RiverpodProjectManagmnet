import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart'; // Ensure this is the correct import for AppForm
import 'Review.dart';
// Ensure the correct file for the Review page

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({Key? key}) : super(key: key);

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  String? _selectedFileName;

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      PlatformFile pickedFile = result.files.first;
      setState(() {
        _selectedFileName = pickedFile.name;
      });
    }
  }

  void _applyButtonPressed() {
    // Navigate to the review page
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Review()), // Ensure Review is correctly implemented
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> formFields = [
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(Icons.email, color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: "Experience",
          prefixIcon:
              Icon(Icons.access_time, color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
      ),
      TextFormField(
        maxLines: null,
        decoration: const InputDecoration(
          labelText: "Bio",
          hintText: "A description of yourself",
          prefixIcon: Icon(Icons.message_rounded,
              color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.cloud_upload_outlined,
            color: Color.fromRGBO(83, 92, 145, 1)),
        title: Text(
            _selectedFileName == null ? "Upload Resume" : _selectedFileName!),
        shape: const OutlineInputBorder(borderSide: BorderSide(width: 0.67)),
        onTap: _selectFile,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Hub"),
        centerTitle: true,
      ),
      body: AppForm(
        formFields: formFields,
        sectionHeaderTitle: "Apply",
        sectionHeaderSubtitle: "Fill out the details to apply",
        sectionHeaderIcon: const Icon(Icons.check_rounded,
            size: 45, color: Color.fromRGBO(83, 92, 145, 1)),
        buttonText: "Apply",
        onButtonPressed: _applyButtonPressed, // Callback for the Apply button
      ),
    );
  }
}
