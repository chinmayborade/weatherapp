import 'package:demoapp/pages/page1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //Image Trailings

          //image1
          Image.asset("lib/forest/forest.jpg"),

          //image2
          Image.asset("lib/forest/forest2.jpg"),

          SizedBox(height: 20),

          //IntroText
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Get Weather Updates At Fingertips!",
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 25),

          //iconbutton
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page1()));
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    fill: BorderSide.strokeAlignCenter,
                    size: 30,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
