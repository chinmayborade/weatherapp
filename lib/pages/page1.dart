import 'package:demoapp/pages/intro_screens/intro_screen1.dart';
import 'package:demoapp/pages/intro_screens/intro_screen2.dart';
import 'package:demoapp/pages/intro_screens/intro_screen3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  //controller to control page
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            Expanded(
              child: IntroScreen1(),
            ),
            Expanded(
              child: IntroScreen2(),
            ),
            Expanded(
              child: IntroScreen3(),
            ),
          ],
        ),

        //dotindiactors
        Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  spacing: 15,
                  dotColor: Colors.black),
            )),
      ],
    ));
  }
}
