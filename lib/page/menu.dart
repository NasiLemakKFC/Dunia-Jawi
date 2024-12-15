import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jawi_app/page/Dunia_1/level_layout.dart';
import 'package:jawi_app/page/Dunia_2/level_layout.dart';

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
          child: Center(
            child: Stack(
              children: [
                Image.asset('asset/image/Menu.png', fit: BoxFit.cover),
                Positioned(
                  top: 320, 
                  left: MediaQuery.of(context).size.width * 0.7 - 50, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LevelDunia1(), 
                        ),
                      );
                    },
                    child: const Text('Mendarat', style: TextStyle(fontSize: 24)),
                  ),
                ),
                Positioned(
                  top: 550, 
                  left: MediaQuery.of(context).size.width * 0.2 - 50, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LevelDunia2(), 
                        ),
                      );
                    },
                    child: const Text('Mendarat', style: TextStyle(fontSize: 24)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


