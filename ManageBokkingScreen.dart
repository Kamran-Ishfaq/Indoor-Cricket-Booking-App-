import 'package:flutter/material.dart';

class ManageBookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Bookings'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,  // Removes the shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header for bookings
            Text(
              'Upcoming Bookings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // List of Bookings
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example, replace with dynamic data
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to booking details screen (implement later)
                    },
                    child: Card(
                      elevation: 10,  // Add shadow for card effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),  // Rounded corners
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent.withOpacity(0.6), Colors.blue.withOpacity(0.4)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.event_available, color: Colors.blueAccent),
                          ),
                          title: Text(
                            'Booking ${index + 1}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            'Booking details for Ground ${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
