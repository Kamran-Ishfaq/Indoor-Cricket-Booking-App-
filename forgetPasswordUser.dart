import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isCodeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo or App Image
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/logo.png'),  // Replace with your logo
              ),
              SizedBox(height: 30),

              // Title
              Text(
                _isCodeSent ? 'Enter Verification Code' : 'Forgot Your Password?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),

              // Instruction Text
              Text(
                _isCodeSent
                    ? 'Enter the code sent to your email.'
                    : 'Enter your email and we\'ll send you a link to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 30),

              // Email Field (only for the first step)
              if (!_isCodeSent)
                _buildTextField(
                  controller: _emailController,
                  label: 'Enter your email',
                  hint: 'Email address',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
              // Code Field (only for the second step)
              if (_isCodeSent)
                _buildTextField(
                  controller: _codeController,
                  label: 'Enter the code',
                  hint: 'Verification code',
                  icon: Icons.code,
                  keyboardType: TextInputType.number,
                ),
              SizedBox(height: 20),

              // Password Fields (only for the third step)
              if (_isCodeSent)
                ...[
                  _buildTextField(
                    controller: _newPasswordController,
                    label: 'New Password',
                    hint: 'Enter your new password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Confirm your new password',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                ],

              // Action Button
              ElevatedButton(
                onPressed: _isCodeSent ? _resetPassword : _sendCode,
                child: Text(_isCodeSent ? 'Reset Password' : 'Send Verification Code'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),

              SizedBox(height: 20),

              // Back to Login Button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);  // Navigate back to the login screen
                },
                child: Text(
                  'Back to Login',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextField builder for consistent styling
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelStyle: TextStyle(color: Colors.blueAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Handle sending verification code
  void _sendCode() {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    // Simulate sending the code to the user's email
    setState(() {
      _isCodeSent = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Verification code sent to $email')),
    );
  }

  // Handle password reset
  void _resetPassword() {
    String code = _codeController.text.trim();
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (code.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    // Simulate resetting the password
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password has been reset successfully')),
    );

    Navigator.pop(context);  // Go back to login screen
  }
}
