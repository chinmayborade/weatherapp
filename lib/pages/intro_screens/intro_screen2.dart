import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

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
            "lib/forest/outdoor.jpg",
          ),

          SizedBox(
            height: 20,
          ),

          //text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Planning Outdoor Activities",
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
              "Weather forecasts allow people to plan outdoor activities and events around expected weather conditions, such as rain, storms, or cold weather.",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
          ),

          SizedBox(height: 10),

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
