import 'package:flutter/material.dart';
import 'package:jawi_app/page/loadpage.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingPage(), 
            ),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/image/MainPage.png'), 
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
