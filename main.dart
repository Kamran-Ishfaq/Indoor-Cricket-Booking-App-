import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/LoginChoiceSceen.dart';
import 'package:fyp_indoor_cricket_booking_app/SignupScreen.dart';
import 'BookingScreen.dart';
import 'GroundDetailed.dart';  // Import GroundDetailsScreen
import 'BookingConfirmScreen.dart'; // Import Booking Confirmation Screen
import 'ProfileScreen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indoor Cricket Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',  // Default route to Splash Screen
      routes: {
        '/': (context) => SplashScreen(),  // Splash Screen
        '/Login Choice':(context)=>LoginChoiceScreen(),
        '/login': (context) => LoginScreen(),  // Login Screen
        '/Sign up':(context) => SignupScreen(),
        '/booking': (context) => BookingScreen(),  // Booking Screen
        '/groundDetails': (context) => GroundDetailsScreen(),  // Ground Details Screen
        '/bookingConfirmation': (context) => BookingConfirmationScreen(),  // Booking Confirmation Screen
        '/profile': (context) => ProfileScreen(),  // Profile Screen
      },
    );
  }
}
