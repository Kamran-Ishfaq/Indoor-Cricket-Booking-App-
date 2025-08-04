import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/adminLoginScreen.dart';
import 'package:fyp_indoor_cricket_booking_app/login_screen.dart';

class LoginChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],  // Set a soft background color
      appBar: AppBar(
        title: Text('Choose Login'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,  // Remove app bar shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add logo at the top
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 150,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40),  // Spacing between logo and buttons

              // Title Text
              Text(
                'Welcome to the Indoor Cricket Booking App!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),  // Spacing between title and buttons

              // Row of Buttons for User and Admin login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // User Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'User Login',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),  // Rounded corners
                      ),
                      elevation: 5,  // Add some shadow for a button effect
                    ),
                  ),
                  SizedBox(width: 20),  // Spacing between buttons

                  // Admin Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute
                        (builder: (context)=>AdminLoginScreen()),);
                    },
                    child: Text(
                      'Admin Login',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),  // Rounded corners
                      ),
                      elevation: 5,  // Add some shadow for a button effect
                    ),
                  ),
                ],
              ),

              // Optional: A small animation or text to guide users
              SizedBox(height: 40),
              Text(
                'Choose a role to proceed',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
