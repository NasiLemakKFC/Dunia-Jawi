import 'package:flutter/material.dart';

class LevelDunia1 extends StatefulWidget {
  const LevelDunia1({super.key});

  @override
  _LevelDunia1State createState() => _LevelDunia1State();
}

class _LevelDunia1State extends State<LevelDunia1> {
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
          builder: (context) => LevelScreen(level: level), // Replace with your level screen widget
        ),
      );
    } else {
      // Show a message if the level is locked
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Level $level is locked!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/image/LevelDunia1.png'), // Replace with your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Over Background
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: levels.map((levelData) {
              int level = levelData['level'];
              bool isUnlocked = levelData['isUnlocked'];
              int stars = levelData['stars'];

              return Column(
                children: [
                  // Level Button
                  GestureDetector(
                    onTap: () => _onLevelTap(level),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: isUnlocked ? Colors.green : Colors.red, // Green if unlocked, Red otherwise
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
                  // Stars Row
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
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class LevelScreen extends StatelessWidget {
  final int level;
  const LevelScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $level'),
      ),
      body: Center(
        child: Text('Level $level Content'),
      ),
    );
  }
}
