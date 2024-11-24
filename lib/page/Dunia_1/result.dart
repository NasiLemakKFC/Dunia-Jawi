import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultDunia1 extends StatelessWidget {
  const ResultDunia1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/image/ResultDunia1.png'),
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),

          // Content Over Background
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(), // Push the content to the middle of the screen
              const Spacer(),
              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // "Kembali" Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        // Logic for "Kembali" button
                        Navigator.pop(context); // Example: Go back
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Text(
                          'Kembali',
                          style: GoogleFonts.archivoBlack(color: Colors.white, fontSize: 18), 
                        ),
                      ),
                    ),
                    // "Seterusnya" Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        // Logic for "Seterusnya" button
                        Navigator.pushNamed(context, '/nextPage'); // Example: Navigate to another page
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        child: Text(
                          'Seterusnya',
                          style: GoogleFonts.archivoBlack(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24), // Add spacing below the buttons
            ],
          ),
        ],
      ),
    );
  }
}
