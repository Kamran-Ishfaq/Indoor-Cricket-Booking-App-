import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/AdminDashboardScreen.dart'; // Import the Admin Dashboard

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleAdminLogin() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // Simulate successful login and navigate to Admin Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminDashboardScreen()),
      );
    } else {
      // Show error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter a valid email and password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Navigate back to the previous screen (LoginChoiceScreen)
          },
        ),
      ),
      backgroundColor: Colors.blue[50], // Lighter background color
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.1, // Light opacity for the background image
              child: Image.asset(
                'assets/background_image.jpg',  // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content in front of the background
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo Image (Circular Avatar)
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/g3.png'), // Replace with your logo
                    ),
                    SizedBox(height: 20),

                    // Title Text
                    Text(
                      'Admin Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 40),

                    // Email TextField with rounded corners and shadows
                    _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 20),

                    // Password TextField with rounded corners and shadows
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 40),

                    // Login Button with gradient background and shadow
                    ElevatedButton(
                      onPressed: _handleAdminLogin,
                      child: Text('Login as Admin'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        backgroundColor: Colors.blueAccent[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),  // Rounded corners for the button
                        ),
                        elevation: 10,  // Add some shadow for depth
                      ),
                    ),
                    SizedBox(height: 20),

                    // Forgot Password Text (with link style)
                    TextButton(
                      onPressed: () {
                        // Handle forgot password functionality
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build text fields with common style
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
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
        obscureText: obscureText,
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
}
