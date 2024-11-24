import 'package:flutter/material.dart';
import 'package:jawi_app/page/create_user.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateUser(), // Replace with your next page widget
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/MainPage.png'), // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
        ),
      ),
    );
  }
}
