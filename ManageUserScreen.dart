import 'package:flutter/material.dart';

class ManageUsersScreen extends StatelessWidget {
  // Sample list of users
  final List<Map<String, String>> users = [
    {'name': 'User 1', 'email': 'user1@example.com', 'phone': '1234567890'},
    {'name': 'User 2', 'email': 'user2@example.com', 'phone': '0987654321'},
    {'name': 'User 3', 'email': 'user3@example.com', 'phone': '1122334455'},
    {'name': 'User 4', 'email': 'user4@example.com', 'phone': '2233445566'},
    {'name': 'User 5', 'email': 'user5@example.com', 'phone': '3344556677'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Users'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,  // Removes the shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header text for users
            Text(
              'Registered Users',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),

            // List of Users
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to user details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(user: users[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 8,  // Add shadow for a card effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),  // Rounded corners
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blueAccent.withOpacity(0.5), Colors.blue.withOpacity(0.3)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(15),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.account_circle, color: Colors.blueAccent, size: 35),
                          ),
                          title: Text(
                            users[index]['name']!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            users[index]['email']!,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
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

class UserDetailScreen extends StatelessWidget {
  final Map<String, String> user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.account_circle, size: 80, color: Colors.white),
            ),
            SizedBox(height: 20),

            // User name
            Text(
              user['name']!,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),

            // User email
            Text(
              'Email: ${user['email']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),

            // User phone
            Text(
              'Phone: ${user['phone']}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 40),

            // Edit button (just as a placeholder for now)
            ElevatedButton(
              onPressed: () {
                // Implement edit functionality later
              },
              child: Text('Edit User'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
