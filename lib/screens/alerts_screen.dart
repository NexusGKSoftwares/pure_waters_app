import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FaultReportingScreen extends StatefulWidget {
  const FaultReportingScreen({super.key});

  @override
  State<FaultReportingScreen> createState() => _FaultReportingScreenState();
}

class _FaultReportingScreenState extends State<FaultReportingScreen> {
  final TextEditingController faultDescriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  List<Image> uploadedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> takePicture() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        uploadedImages.add(
          Image.file(
            File(photo.path),
            height: 100,
            width: 100,
          ),
        );
      });
    }
  }

  Future<void> uploadPicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        uploadedImages.add(
          Image.file(
            File(image.path),
            height: 100,
            width: 100,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Set the blue background
      appBar: AppBar(
        title: const Text('Report a Fault'),
        backgroundColor: Colors.blueAccent, // More vibrant color for the AppBar
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fault description field
              const Text(
                'Describe the Issue:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: faultDescriptionController,
                decoration: InputDecoration(
                  hintText: 'e.g., Water leakage, no supply, etc.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              // Location field
              const Text(
                'Location:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'e.g., Street name, neighborhood, etc.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Add images section
              const Text(
                'Add Images:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: takePicture,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take Picture'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: uploadPicture,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload Picture'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Preview images section
              const Text(
                'Preview Images:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 8),
              uploadedImages.isEmpty
                  ? const Center(
                child: Text(
                  'No images added.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
                  : Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: uploadedImages,
              ),
              const SizedBox(height: 24),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String faultDescription = faultDescriptionController.text;
                    String location = locationController.text;

                    if (faultDescription.isNotEmpty && location.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fault report submitted successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all the details.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Submit Report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
