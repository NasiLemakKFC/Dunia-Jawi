import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class D2aras1 extends StatefulWidget {
  const D2aras1({super.key});

  @override
  _D2aras1State createState() => _D2aras1State();
}

class _D2aras1State extends State<D2aras1> {
  final _supabase = Supabase.instance.client;

  int _currentQuestionID = 1;
  String _question = '';
  String _correctAnswerID = "";
  List<Map<String, dynamic>> _shuffledOptions = [];
  List<bool?> _selectedOptions = [];
  final List<String> _imagePaths = [];

Future<void> fetchQuestionsAndOptions() async {
  try {
    // Fetch data from the database
    final response = await _supabase
        .from('Aras1_soalan_gambar')
        .select('id, Soalan, Jawapan') // Include 'gambar' in the select statement
        .eq('id', _currentQuestionID)
        .single(); // Fetch one question at a time

    setState(() {
      _question = response['Soalan'];
      _correctAnswerID = response['Jawapan'];

      // Initialize the _selectedOptions list with `null`
      _selectedOptions = List<bool?>.filled(4, null); // Assuming 4 options

      setState(() {
          _shuffledOptions = [
            {'id': '1', 'imagePath': 'asset/image/Jari.png'},
            {'id': '2', 'imagePath': 'asset/image/Kaki.png'},
            {'id': '3', 'imagePath': 'asset/image/Mata.png'},
            {'id': '4', 'imagePath': 'asset/image/Muka.png'},
          ];

        _shuffledOptions.shuffle(); // Shuffle options for randomness
        _selectedOptions = List<bool?>.filled(_shuffledOptions.length, null);
      });

      print("Salamalekom");
      print(_imagePaths);
    });
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  void initState() {
    super.initState();
    fetchQuestionsAndOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Page'),
      ),
      body: Column(
        children: [
          // Center(
          //   child: Image.asset('asset/image/Jari.png'),
          // ),
          Text(_question),
          Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _shuffledOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: _selectedOptions[index] == null
                        ? () {
                            setState(() {
                              bool isCorrect = _shuffledOptions[index]['imagePath'] == _correctAnswerID;
                              _selectedOptions[index] = isCorrect;
                            });
                            print (_correctAnswerID);
                            print(_selectedOptions);
                          }
                        : null, // Disable tapping if already selected
                    child: Card(
                      elevation: 4,
                      color: _selectedOptions[index] == null
                          ? Colors.white // Default color
                          : (_selectedOptions[index]! ? Colors.green : Colors.red), // Correct: Green, Incorrect: Red
                      child: Center(
                        child: Image.asset(
                          _shuffledOptions[index]['imagePath'], // Dynamically reference image path
                          fit: BoxFit.cover, // Scale to fit card dimensions
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
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
                            fetchQuestionsAndOptions(); // Fetch the next question
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