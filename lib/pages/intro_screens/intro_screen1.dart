import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),

          //Image
          Image.asset(
            "lib/forest/forest4.jpg",
          ),

          SizedBox(
            height: 20,
          ),

          //text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Preparing for the Weather",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          //infotext
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Weather forecasts help people determine how to dress and prepare for the day's weather conditions, whether it's warm, cold, windy, or rainy",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
          ),

          SizedBox(height: 70),

          Text(
            "Swipe >>>",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
