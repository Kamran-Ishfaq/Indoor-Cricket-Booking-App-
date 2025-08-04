import 'package:flutter/material.dart';

class ManageTournamentsScreen extends StatefulWidget {
  @override
  _ManageTournamentsScreenState createState() => _ManageTournamentsScreenState();
}

class _ManageTournamentsScreenState extends State<ManageTournamentsScreen> {
  final _tournamentController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Tournaments'),
        backgroundColor: Colors.blueAccent,
        elevation: 0, // Removes the shadow for a cleaner look
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
            // Tournament Name Section
            _buildSectionTitle('Add New Tournament'),
            SizedBox(height: 10),

            // Circle Avatar for Tournament Name
            _buildCircleAvatar(Icons.sports_baseball, 'Tournament Name'),

            // Tournament Name Input Field
            SizedBox(height: 10),
            _buildTextField(
              controller: _tournamentController,
              label: 'Tournament Name',
              hint: 'Enter tournament name',
              icon: Icons.sports_baseball,
            ),
            SizedBox(height: 20),

            // Tournament Date Section
            _buildSectionTitle('Select Tournament Date'),
            SizedBox(height: 10),

            // Circle Avatar for Tournament Date
            _buildCircleAvatar(Icons.calendar_today, 'Select Date'),
             SizedBox(height: 10),
            // Date Input Field for Tournament
            _buildTextField(
              controller: _dateController,
              label: 'Date of Tournament',
              hint: 'Select tournament date',
              icon: Icons.calendar_today,
            ),
            SizedBox(height: 40),

            // Save Button
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  // Circle Avatar Widget
  Widget _buildCircleAvatar(IconData icon, String title) {
    return Center(
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.blueAccent,
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  // TextField Widget with icon
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelStyle: TextStyle(color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Save Button Widget
  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Logic to save tournament details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tournament Saved!')),
        );
      },
      child: Text('Save Tournament'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        textStyle: TextStyle(fontSize: 18),
        backgroundColor: Colors.greenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50), // Full width button
      ),
    );
  }
}
