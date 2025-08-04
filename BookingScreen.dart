import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/ProfileScreen.dart';  // Import Profile screen
import 'package:fyp_indoor_cricket_booking_app/ManageGroundScreen.dart'; // Import the ManageGroundScreen

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Sample dynamic list to represent admin added grounds
  List<Map<String, dynamic>> groundList = [
    {'name': 'Ground 1', 'location': 'Location 1', 'image': 'assets/g1.jpeg'},
    {'name': 'Ground 2', 'location': 'Location 2', 'image': 'assets/g2.jpeg'},
    {'name': 'Ground 3', 'location': 'Location 3', 'image': 'assets/g3.jpeg'},
    {'name': 'Ground 4', 'location': 'Location 4', 'image': 'assets/g4.jpeg'},
    {'name': 'Ground 5', 'location': 'Location 5', 'image': 'assets/g5.jpeg'},
    {'name': 'Ground 6', 'location': 'Location 6', 'image': 'assets/g2.png'},
    // You can dynamically add more grounds via backend
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indoor Cricket Booking'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle), // Profile Icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4, // Adjust opacity for background image
              child: Image.asset(
                'assets/logo.png', // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Welcome to the Indoor Cricket Booking App!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Available Grounds:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20),

                    // GridView for displaying grounds dynamically
                    GridView.builder(
                      itemCount: groundList.length, // Dynamically show the number of grounds
                      shrinkWrap: true, // Makes the GridView scrollable within the Column
                      physics: NeverScrollableScrollPhysics(), // Disables inner scrolling
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 grounds per row
                        crossAxisSpacing: 10, // Space between columns
                        mainAxisSpacing: 10, // Space between rows
                        childAspectRatio: 0.8, // Aspect ratio of the items
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/groundDetails', // Navigate to GroundDetailsScreen
                              arguments: index,  // Pass selected ground index
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(groundList[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        groundList[index]['name'], // Display ground name
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Location: ${groundList[index]['location']}', // Display location
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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
}
