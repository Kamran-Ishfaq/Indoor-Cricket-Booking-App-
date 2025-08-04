import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/BookingScreen.dart'; // Import the Booking Screen
import 'login_screen.dart'; // Assuming you have this screen

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Simulate a simple signup validation
  void _handleSignup() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // If signup is successful, navigate to the Booking Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BookingScreen()),
      );
    } else {
      // If fields are empty, show error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a valid email and password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/g2.jpeg'),  // Set the background image
            fit: BoxFit.cover,
            opacity: 0.4,  // Reduce opacity for background image
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add a top logo or image
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logo.png', // Replace with your logo image
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Header Text for Create Account
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email TextField with icon
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueAccent.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Password TextField with icon
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      filled: true,
                      fillColor: Colors.blueAccent.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),

                  // Sign Up Button with a gradient
                  ElevatedButton(
                    onPressed: _handleSignup,
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      backgroundColor: Colors.greenAccent, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 50),  // Full width button
                    ),
                  ),
                  SizedBox(height: 20),

                  // Link to login page (if already have an account)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to Login page
                        );
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
