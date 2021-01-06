import 'package:flutter/material.dart';
import './components/body.dart';
import '../drawer/drawerscreen.dart';
import '../profile_screen/profile_screen.dart';

class Home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: IconButton(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile_screen()),
                ),
              },
            ),
          ),
        ],
      ),
      drawer: Drawerscreen(),
      body: Body(),
    );
  }
}
