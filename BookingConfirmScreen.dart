import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // To format the date

class BookingConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the arguments passed to this screen (from GroundDetailsScreen)
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String groundName = args['groundName'];
    final String groundLocation = args['groundLocation'];
    final DateTime selectedDate = args['selectedDate'];
    final TimeOfDay selectedTime = args['selectedTime'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display ground image
            Image.asset(
              'assets/g1.jpeg', // Update the image path as per ground selected
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            // Ground name and location
            Text(
              groundName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Location: $groundLocation',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            // Display selected date and time
            Text(
              'Selected Date: ${DateFormat.yMd().format(selectedDate)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Selected Time: ${selectedTime.format(context)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),

            // Total cost (for example purposes, replace with actual logic)
            Text(
              'Total Cost: \$50.00',  // Placeholder price
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 40),

            // Confirm and Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: Text('Cancel Booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // Confirm Button
                ElevatedButton(
                  onPressed: () {
                    // Handle booking confirmation (Proceed to payment or finalization)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Booking Confirmed!')),
                    );
                  },
                  child: Text('Confirm Booking'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
