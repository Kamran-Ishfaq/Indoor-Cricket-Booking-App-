import 'package:flutter/material.dart';

class ManagePricingScreen extends StatefulWidget {
  @override
  _ManagePricingScreenState createState() => _ManagePricingScreenState();
}

class _ManagePricingScreenState extends State<ManagePricingScreen> {
  final _pricingController = TextEditingController();
  final _timeSlotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Pricing & Time Slots'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent.withOpacity(0.3), Colors.blue.withOpacity(0.3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Set Pricing for Grounds',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // Pricing Icon with Circle Avatar
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.attach_money,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Pricing Input Field
            _buildTextField(
              controller: _pricingController,
              label: 'Enter Price per Hour',
              hint: 'e.g., 50',
              icon: Icons.attach_money,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),

            // Time Slot Icon with Circle Avatar
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Time Slot Input Field
            _buildTextField(
              controller: _timeSlotController,
              label: 'Enter Time Slot',
              hint: 'e.g., 9:00 AM - 12:00 PM',
              icon: Icons.access_time,
            ),
            SizedBox(height: 40),

            // Save Button
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  // TextField builder for consistent styling with CircleAvatar
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          labelStyle: TextStyle(color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blueAccent, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  // Save Button Widget with Full Width
  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Logic to save pricing and time slot
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pricing & Time Slot Saved!')),
        );
      },
      child: Text('Save Pricing & Time Slot'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        textStyle: TextStyle(fontSize: 18),
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),  // Full width button
      ),
    );
  }
}
