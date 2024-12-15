import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jawi_app/page/Dunia_1/aras1.dart';
import 'package:jawi_app/page/Dunia_2/aras1.dart';
import 'package:outlined_text/outlined_text.dart';

class LevelDunia2 extends StatefulWidget {
  const LevelDunia2({super.key});

  @override
  _LevelDunia2State createState() => _LevelDunia2State();
}

class _LevelDunia2State extends State<LevelDunia2> {
  // Levels data
  List<Map<String, dynamic>> levels = [
    {
      "level": 1,
      "isUnlocked": true,
      "stars": 3, // Number of stars earned
    },
    {
      "level": 2,
      "isUnlocked": false,
      "stars": 0, // Default
    },
    {
      "level": 3,
      "isUnlocked": false,
      "stars": 0,
    },
    {
      "level": 4,
      "isUnlocked": false,
      "stars": 0,
    },
  ];

  // Method to handle level click
  void _onLevelTap(int level) {
    if (levels[level - 1]['isUnlocked']) {
      // Navigate to the respective level
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Aras1(), // Replace with your level screen widget
        ),
      );
    } else {
      // Show a message if the level is locked
    }
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true, 
    appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  //pop to previous page
                  Navigator.pop(context);
                }, 
                icon: Image.asset('asset/image/BackButton.png'),
                iconSize: 80,
              ),
              Expanded(
                child: OutlinedText(
                  text: Text(
                    'Dunia Penentuan',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.archivoBlack(fontSize: 28, color: const Color.fromRGBO(126, 197, 217, 100)),
                  ),
                  strokes: [
                    OutlinedTextStroke(color: Colors.black, width: 2),
                  ],
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        
              body: Stack(
            children: [
              // Background Image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/image/LevelDunia2.png'), // Background image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Positioned Buttons
              Positioned(
                top: 120, // Adjust to align with the first button
                left: MediaQuery.of(context).size.width * 0.5 - 50, // Center horizontally
                child: _buildLevelButton(1, levels[0]['isUnlocked'], levels[0]['stars']),
              ),
              Positioned(
                top: 220,
                left: MediaQuery.of(context).size.width * 0.3 - 50, // Adjust left alignment
                child: _buildLevelButton(2, levels[1]['isUnlocked'], levels[1]['stars']),
              ),
              Positioned(
                top: 320,
                left: MediaQuery.of(context).size.width * 0.7 - 50,
                child: _buildLevelButton(3, levels[2]['isUnlocked'], levels[2]['stars']),
              ),
              Positioned(
                top: 420,
                left: MediaQuery.of(context).size.width * 0.5 - 50,
                child: _buildLevelButton(4, levels[3]['isUnlocked'], levels[3]['stars']),
              ),
            ],
          ),
  );
  }
}

Widget _buildLevelButton(int level, bool isUnlocked, int stars) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () => const D2aras1(),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isUnlocked ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Aras $level",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < stars ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    );
                  }),
                ),
              ],
            );
          }

class LevelScreen extends StatelessWidget {
  final int level;
  const LevelScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Level $level'),
      ),
      body: Center(
        child: Text('Level $level Content'),
      ),
    );
  }
}

