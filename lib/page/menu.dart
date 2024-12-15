import 'package:flutter/material.dart';

class PlanetSelection extends StatefulWidget {
  const PlanetSelection({super.key});

  @override
  State<PlanetSelection> createState() => PlanetSelectionState();
}

class PlanetSelectionState extends State<PlanetSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: SingleChildScrollView(
          child: Center(child: Image.asset('asset/image/Menu.png', fit: BoxFit.cover))
        ),
      ),
    );
  }
}

