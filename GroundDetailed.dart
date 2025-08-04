import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date
import 'package:flutter/widgets.dart'; // To use the TimeOfDay class

class GroundDetailsScreen extends StatefulWidget {
  @override
  _GroundDetailsScreenState createState() => _GroundDetailsScreenState();
}

class _GroundDetailsScreenState extends State<GroundDetailsScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // Date Picker function
  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  // Time Picker function
  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected ground index from the arguments passed
    final int groundIndex = ModalRoute.of(context)!.settings.arguments as int;

    // Sample data for ground details
    final groundDetails = [
      {'name': 'Ground 1', 'location': 'Location 1', 'image': 'assets/g1.jpeg', 'description': 'A great cricket ground with excellent facilities.'},
      {'name': 'Ground 2', 'location': 'Location 2', 'image': 'assets/g2.jpeg', 'description': 'Perfect for all levels of cricket players.'},
      {'name': 'Ground 3', 'location': 'Location 3', 'image': 'assets/g3.jpeg', 'description': 'Spacious ground for tournaments and casual play.'},
      {'name': 'Ground 4', 'location': 'Location 4', 'image': 'assets/g4.jpeg', 'description': 'A great cricket ground with excellent facilities.'},
      {'name': 'Ground 5', 'location': 'Location 5', 'image': 'assets/g5.jpeg', 'description': 'Perfect for all levels of cricket players.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Ground Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Display ground image with a border radius
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  groundDetails[groundIndex]['image']!,
                  fit: BoxFit.cover,
                  height: 220.0,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 20),

              // Display ground name
              Text(
                groundDetails[groundIndex]['name']!,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),

              // Display ground location
              Text(
                'Location: ${groundDetails[groundIndex]['location']}',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20),

              // Display ground description
              Text(
                groundDetails[groundIndex]['description']!,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 30),

              // Date Picker Section
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickDate,
                    child: Text(
                      selectedDate == null
                          ? 'Pick Date'
                          : 'Selected Date: ${DateFormat.yMd().format(selectedDate!)}',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Time Picker Section
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _pickTime,
                    child: Text(
                      selectedTime == null
                          ? 'Pick Time'
                          : 'Selected Time: ${selectedTime!.format(context)}',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // Confirmation button for booking
              ElevatedButton(
                onPressed: () {
                  if (selectedDate != null && selectedTime != null) {
                    // Navigate to Booking Confirmation Screen with selected data
                    Navigator.pushNamed(
                      context,
                      '/bookingConfirmation', // Navigate to Booking Confirmation screen
                      arguments: {
                        'groundName': groundDetails[groundIndex]['name'],
                        'groundLocation': groundDetails[groundIndex]['location'],
                        'selectedDate': selectedDate,  // Selected date
                        'selectedTime': selectedTime, // Selected time
                      },
                    );
                  } else {
                    // Show an alert if date/time is not selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select both date and time')),
                    );
                  }
                },
                child: Text('Confirm Booking'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
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
}
