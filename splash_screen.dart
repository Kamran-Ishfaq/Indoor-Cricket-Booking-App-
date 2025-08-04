import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // For loading animation
import 'package:fyp_indoor_cricket_booking_app/LoginChoiceSceen.dart';
import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Home Screen after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginChoiceScreen(),),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background for modern look
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Animated logo with a scaling effect
              AnimatedContainer(
                duration: Duration(seconds: 10),
                curve: Curves.easeIn,
                child: Image.asset(
                  'assets/logo.png',  // Replace with your app's logo
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),

              // Loading animation (SpinKit)
              SpinKitFadingCircle(
                color: Colors.white,
                size: 90.0,
              ),
              SizedBox(height: 20),

              // Text below the loading spinner with better font design
              Text(
                'Bringing Cricket to Your Fingertips!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',  // You can replace this with a custom font
                  letterSpacing: 1.5,  // Adds a bit of space between letters for style
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              // Optional: App version or tagline
              Text(
                'The Ultimate Cricket Booking Experience',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
