import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jawi_app/page/Dunia_1/level_layout.dart';
import 'package:jawi_app/page/Dunia_2/aras1.dart';
import 'package:just_audio/just_audio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Aras1 extends StatefulWidget {
  const Aras1({super.key});

  @override
  _Aras1State createState() => _Aras1State();
}

class _Aras1State extends State<Aras1> {
  int _currentQuestionID = 1; // Start with the first question
  List<Map<String, dynamic>> _shuffledOptions = [];
  String _question = "";
  int _correctAnswerID = -1;
  List<bool?> _selectedOptions = [];
  final player = AudioPlayer();

  final supabase = Supabase.instance.client;

  Future<void> fetchQuestionsAndOptions() async {
    try {
      // Fetch data from the database
      final response = await supabase
          .from('Aras2_level1_soalan')
          .select('id, Soalan, JawapanID, aras2_level1_jawapan(id, Jawapan)')
          .eq('id', _currentQuestionID)
          .single(); // Fetch one question at a time

      setState(() {
        _question = response['Soalan'];
        _correctAnswerID = response['JawapanID'];

        // Shuffle the options and store them
        _shuffledOptions = List<Map<String, dynamic>>.from(response['aras2_level1_jawapan']);
        _shuffledOptions.shuffle(Random());

        // Initialize the _selectedOptions list with `null`
        _selectedOptions = List<bool?>.filled(_shuffledOptions.length, null);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuestionsAndOptions(); // Fetch the first question on startup
  }

  @override
void dispose() {
  player.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Dunia Mengeja"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: _shuffledOptions.isEmpty
          ? const Center(child: CircularProgressIndicator()) // Show loader until data is fetched
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //aras dan indicator

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Aras 1",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "$_currentQuestionID/4",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Question Text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _question,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () async {
                      await player.setAsset("asset/audio/$_question.mp3");
                      player.play();
                    },
                  ),

                // Options Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: _shuffledOptions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: _selectedOptions[index] == null // Allow tapping only if not already selected
                            ? () {
                                setState(() {
                                  bool isCorrect = _shuffledOptions[index]['id'] == _correctAnswerID;
                                  _selectedOptions[index] = isCorrect; // Update option state
                                });
                              }
                            : null, // Disable tapping if already selected
                        child: Card(
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 2), // Set the border color and width
                            ),
                            color: _selectedOptions[index] == null
                                ? Colors.blue // Default color
                                : (_selectedOptions[index]! ? Colors.green : Colors.red), // Correct: Green, Incorrect: Red
                            child: Center(
                              child: Text(
                                _shuffledOptions[index]['Jawapan'],
                                style: const TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      );
                    },
                  ),
                ),

                // "Seterusnya" Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed:
                     _selectedOptions.contains(true) // Enable only if a correct answer was selected
                        ? () {
                            setState(() {
                              _currentQuestionID++; // Move to the next question
                            });
                            fetchQuestionsAndOptions(); 
                            
                            if (_currentQuestionID == 5){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LevelDunia1())); // Fetch the next question
                          }
                        }
                        : null, // Disable if no correct answer
                    child: const Text(
                      "Seterusnya",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
