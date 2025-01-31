import 'package:connect/pages/assessAi.dart';
import 'package:flutter/material.dart';

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController availableResourcesController = TextEditingController();
  final TextEditingController neededResourcesController = TextEditingController();

  String? projectType;

  void handleSubmit() {
    if (projectType == null ||
        nameController.text.isEmpty ||
        locationController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        availableResourcesController.text.isEmpty ||
        neededResourcesController.text.isEmpty) {
      return;
    }

    Map<String, String> projectData = {
      "name": nameController.text,
      "type": projectType!,
      "location": locationController.text,
      "description": descriptionController.text,
      "availableResources": availableResourcesController.text,
      "neededResources": neededResourcesController.text,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssessProjectScreen(projectData: projectData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Project"),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Name of the Project", nameController),
              const SizedBox(height: 16),
              buildDropdown(),
              const SizedBox(height: 16),
              buildTextField("Location of Project", locationController),
              const SizedBox(height: 16),
              buildTextField("Description of Project", descriptionController, maxLines: 3),
              const SizedBox(height: 16),
              buildTextField("Current Resources Available", availableResourcesController, maxLines: 3),
              const SizedBox(height: 16),
              buildTextField("Resources Needed", neededResourcesController, maxLines: 3),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Assess Project"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }

  Widget buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Type of Project", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: projectType,
          items: ["Solar", "Wind", "Hydro", "Biomass"].map((type) {
            return DropdownMenuItem(
              value: type.toLowerCase(),
              child: Text(type, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) => setState(() => projectType = value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
