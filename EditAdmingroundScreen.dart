import 'package:flutter/material.dart';

class EditGroundScreen extends StatefulWidget {
  final Map<String, String> ground;
  final int index;

  EditGroundScreen({required this.ground, required this.index});

  @override
  _EditGroundScreenState createState() => _EditGroundScreenState();
}

class _EditGroundScreenState extends State<EditGroundScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.ground['name']!;
    _locationController.text = widget.ground['location']!;
    _descriptionController.text = widget.ground['description'] ?? '';
  }

  void _saveGround() {
    setState(() {
      widget.ground['name'] = _nameController.text;
      widget.ground['location'] = _locationController.text;
      widget.ground['description'] = _descriptionController.text;
    });
    Navigator.pop(context); // Go back to the Manage Grounds screen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ground Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_image.jpg'), // Set a background image
            fit: BoxFit.cover,
            opacity: 0.2,  // Adjust opacity to make the content stand out
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ground Image (image at the top of the screen)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.ground['image']!, // Use the existing ground image
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Ground Name Input
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Ground Name',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintText: 'Enter ground name',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    prefixIcon: Icon(Icons.location_city, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Ground Location Input
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintText: 'Enter ground location',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    prefixIcon: Icon(Icons.location_on, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Ground Description Input
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintText: 'Enter ground description',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    prefixIcon: Icon(Icons.description, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 40),

                // Save Button with styling
                ElevatedButton(
                  onPressed: _saveGround,
                  child: Text('Save Ground Details'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
