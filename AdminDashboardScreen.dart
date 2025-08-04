import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/ManageGroundScreen.dart'; // Import the Manage Grounds screen
import 'package:fyp_indoor_cricket_booking_app/ManageBokkingScreen.dart'; // Import the Manage Bookings screen
import 'package:fyp_indoor_cricket_booking_app/ManageUserScreen.dart'; // Import the Manage Users screen
import 'package:fyp_indoor_cricket_booking_app/ManagePricetimeScreen.dart'; // Import the Manage Pricing & Time Slots screen
import 'package:fyp_indoor_cricket_booking_app/ManageTournamentScreen.dart'; // Import the Manage Tournaments screen
import 'package:fyp_indoor_cricket_booking_app/AdminProfileScreen.dart'; // Import Admin Profile screen

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Image with Name
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profiole.jpg'), // Replace with actual profile image
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Welcome, Admin',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Dashboard Options
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 25,
                childAspectRatio: 1.2,
                children: [
                  // Manage Grounds
                  _buildDashboardCard(
                    icon: Icons.place,
                    title: 'Manage Grounds',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminManageGroundsScreen()),
                      );
                    },
                  ),

                  // Manage Bookings
                  _buildDashboardCard(
                    icon: Icons.book_online,
                    title: 'Manage Bookings',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageBookingsScreen()),
                      );
                    },
                  ),

                  // Manage Users
                  _buildDashboardCard(
                    icon: Icons.group,
                    title: 'Manage Users',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageUsersScreen()),
                      );
                    },
                  ),

                  // Manage Pricing & Time Slots
                  _buildDashboardCard(
                    icon: Icons.access_time,
                    title: 'Manage Pricing & Time Slots',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManagePricingScreen()),
                      );
                    },
                  ),

                  // Manage Tournaments
                  _buildDashboardCard(
                    icon: Icons.sports_cricket,
                    title: 'Manage Tournaments',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ManageTournamentsScreen()),
                      );
                    },
                  ),

                  // Admin Profile
                  _buildDashboardCard(
                    icon: Icons.account_circle,
                    title: 'Admin Profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a dashboard card with an icon
  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
