import 'package:demoapp/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

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
            "lib/forest/farm.jpg",
          ),

          SizedBox(
            height: 20,
          ),

          //text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Agricultural Planning",
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
              "Farmers and gardeners use weather forecasts to plan for crop irrigation, protection, and other weather-dependent activities",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
          ),

          SizedBox(height: 10),

          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
