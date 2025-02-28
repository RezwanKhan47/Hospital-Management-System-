import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class DemoUploadImage extends StatefulWidget {
  const DemoUploadImage({super.key});

  @override
  _DemoUploadImageState createState() => _DemoUploadImageState();
}

class _DemoUploadImageState extends State<DemoUploadImage> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();

  // List of departments
  List<String> departments = [
    'Neurologist',
    'Cardiologist',
    'Orthopedic',
    'Hematologist'
  ];
  String? selectedDepartment;

  Future choiceImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future uploadImage() async {
    final uri =
        Uri.parse("http://192.168.0.109/image_upload_php_mysql/upload.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['name'] = nameController.text;

    // Pass the selected department to the backend
    if (selectedDepartment != null) {
      request.fields['department'] = selectedDepartment!;
    }

    if (_image != null) {
      var pic = await http.MultipartFile.fromPath("image", _image!.path);
      request.files.add(pic);
    } else {
      print("No image selected");
      return;
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: selectedDepartment,
                decoration: InputDecoration(
                  labelText: 'Select Department',
                  border: OutlineInputBorder(),
                ),
                items: departments.map((String department) {
                  return DropdownMenuItem<String>(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedDepartment = value;
                  });
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                choiceImage();
              },
            ),
            Container(
              child: _image == null
                  ? Text('No Image Selected')
                  : Image.file(_image!),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Upload Image'),
              onPressed: () {
                uploadImage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
