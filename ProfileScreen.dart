import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/g2.jpeg'), // Profile Picture
              ),
              SizedBox(height: 20),

              // Profile Name
              Text(
                'User Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),

              // Profile Email
              Text(
                'useremail@example.com',
                style: TextStyle(fontSize: 18, color: Colors.blueAccent),
              ),
              SizedBox(height: 40),

              // Booking History Heading
              Text(
                'Booking History:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),

              // Dummy Booking History
              ListView.builder(
                itemCount: 3,  // Example: 3 past bookings
                shrinkWrap: true,  // Makes the ListView scrollable within the Column
                physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.5),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      leading: Icon(
                        Icons.sports_cricket,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      title: Text(
                        'Booking ${index + 1}',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Ground: Example Ground\nDate: 2025-07-24',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),

              // Edit Profile Button
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Edit Profile (you can integrate this with your backend)
                    },
                    child: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 15,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      // Handle Logout (Firebase Auth or custom logout logic)
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 15,
                    ),
                  ),
                ]

              )

            ],
          ),
        ),
      ),
    );
  }
}
