import 'package:flutter/material.dart';
import 'package:fyp_indoor_cricket_booking_app/EditAdmingroundScreen.dart';
import 'EditAdmingroundScreen.dart'; // Import the Edit Ground screen

class AdminManageGroundsScreen extends StatefulWidget {
  @override
  _AdminManageGroundsScreenState createState() => _AdminManageGroundsScreenState();
}

class _AdminManageGroundsScreenState extends State<AdminManageGroundsScreen> {
  // Sample data for grounds
  final List<Map<String, String>> grounds = [
    {'name': 'Ground 1', 'location': 'Location 1', 'image': 'assets/g1.jpeg'},
    {'name': 'Ground 2', 'location': 'Location 2', 'image': 'assets/g2.jpeg'},
    {'name': 'Ground 3', 'location': 'Location 3', 'image': 'assets/g3.jpeg'},
    {'name': 'Ground 4', 'location': 'Location 4', 'image': 'assets/g4.jpeg'},
    {'name': 'Ground 5', 'location': 'Location 5', 'image': 'assets/g5.jpeg'},
  ];

  // Function to simulate adding a new ground
  void _addNewGround() {
    setState(() {
      grounds.add({
        'name': 'New Ground',
        'location': 'New Location',
        'image': 'assets/g1.jpeg',  // Placeholder image
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Grounds'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addNewGround,  // Add ground functionality
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Button to add a new ground
            ElevatedButton(
              onPressed: _addNewGround,
              child: Text('Add New Ground'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
            ),
            SizedBox(height: 20),

            // Grid of Grounds
            Expanded(
              child: GridView.builder(
                itemCount: grounds.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // Two items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,  // Aspect ratio for the grid items
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to Edit Ground screen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditGroundScreen(
                            ground: grounds[index],
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(grounds[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  grounds[index]['name']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  grounds[index]['location']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
