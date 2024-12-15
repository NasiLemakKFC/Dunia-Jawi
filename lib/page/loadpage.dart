import 'package:flutter/material.dart';
import 'package:jawi_app/page/menu.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const PlanetSelection(), // Replace with your next page widget
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'asset/image/Loading.png'), // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
        ),
      ),
    );
  }
}
