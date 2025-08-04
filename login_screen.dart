import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/BookingScreen.dart';
import 'package:fyp_indoor_cricket_booking_app/LoginChoiceSceen.dart'; // Import the choice screen
import 'package:fyp_indoor_cricket_booking_app/SignupScreen.dart';
import 'package:fyp_indoor_cricket_booking_app/forgetPasswordUser.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Navigate back to the previous screen (LoginChoiceScreen)
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Logo with light opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,  // Adjust the opacity to make the logo light in background
              child: Image.asset(
                'assets/logo.png',  // Add your logo here
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Content on top of the logo
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Logo or Image (now appears more prominent)
                    Container(
                      padding: EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/logo.png',  // Add your logo here
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 40),

                    // Email Text Field
                    _buildTextField(
                      controller: _emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 20),

                    // Password Text Field
                    _buildTextField(
                      controller: _passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to Home Screen after login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingScreen()),
                        );
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Forgot Password Link
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),);
                        // Handle forgot password functionality
                      },
                      child: Text('Forgot Password?',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w900, fontSize: 16)),
                    ),
                    SizedBox(height: 20),

                    // Login/SignUp Buttons in Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Sign Up Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()),);// Navigate to Sign Up screen
                            },
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.greenAccent, // Button color for SignUp
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        // OR Text
                        Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        // Social Media Login Button (Example: Google)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Implement Google SignIn or other social login
                            },
                            icon: Icon(Icons.login, color: Colors.white),
                            label: Text('Sign In with Google'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
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
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
