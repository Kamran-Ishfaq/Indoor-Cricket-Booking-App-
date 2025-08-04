import 'package:flutter/material.dart';

class AdminProfileScreen extends StatefulWidget {
  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  // TextEditingControllers for input fields
  final _groundNameController = TextEditingController();
  final _groundLocationController = TextEditingController();
  final _priceController = TextEditingController();
  final _timeSlotController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _groundNameController.dispose();
    _groundLocationController.dispose();
    _priceController.dispose();
    _timeSlotController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent.withOpacity(0.3), Colors.blue.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/logo.png'), // Replace with actual profile picture
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20),

              // Ground Name Input
              _buildTextField(
                controller: _groundNameController,
                label: 'Ground Name',
                hint: 'Enter Ground Name',
                icon: Icons.landscape,
              ),
              SizedBox(height: 20),

              // Ground Location Input
              _buildTextField(
                controller: _groundLocationController,
                label: 'Location',
                hint: 'Enter Ground Location',
                icon: Icons.location_on,
              ),
              SizedBox(height: 20),

              // Price Input
              _buildTextField(
                controller: _priceController,
                label: 'Price per Hour',
                hint: 'Enter Price per Hour',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // Time Slot Input
              _buildTextField(
                controller: _timeSlotController,
                label: 'Available Time Slot',
                hint: 'Enter Time Slot (e.g., 9 AM - 12 PM)',
                icon: Icons.access_time,
              ),
              SizedBox(height: 20),

              // Description Input
              _buildTextField(
                controller: _descriptionController,
                label: 'Ground Description',
                hint: 'Enter Ground Description',
                icon: Icons.description,
                maxLines: 4,
              ),
              SizedBox(height: 40),

              // Save Button
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save Ground Info'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build text fields with common style
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  // Handle saving the profile (ground details)
  void _saveProfile() {
    String groundName = _groundNameController.text;
    String location = _groundLocationController.text;
    String price = _priceController.text;
    String timeSlot = _timeSlotController.text;
    String description = _descriptionController.text;

    if (groundName.isNotEmpty && location.isNotEmpty && price.isNotEmpty && timeSlot.isNotEmpty && description.isNotEmpty) {
      // Simulate saving the data
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ground Information Saved Successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
    }
  }
}
