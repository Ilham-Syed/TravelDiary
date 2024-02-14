import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Logo
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("path_to_your_profile_image.jpg"),
          ),
          SizedBox(height: 20),

          // User Name
          Text(
            "User Name",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          // User Details Section
          ListTile(
            leading: Icon(Icons.email),
            title: Text("user@example.com"),
          ),
          Divider(),

          // Upcoming Trips Section
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Upcoming Trips"),
            onTap: () {
              // Handle Upcoming Trips option here
            },
          ),
          Divider(),

          // Previous Trips Option
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Previous Trips"),
            onTap: () {
              // Handle Previous Trips option here
            },
          ),
          Divider(),

          // Settings Option
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Handle Settings option here
            },
          ),
          Divider(),

          // Log Out Option
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
            onTap: () {
              // Handle Log Out option here
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
