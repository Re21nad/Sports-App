import "package:flutter/material.dart";

import "package:smooth_page_indicator/smooth_page_indicator.dart";

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_app/scanner/login.dart';

class OnBoaringScanner extends StatefulWidget {
  const OnBoaringScanner({super.key});

  @override
  State<OnBoaringScanner> createState() => _OnBoaringScannerState();
}

class _OnBoaringScannerState extends State<OnBoaringScanner> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/onBoading1.png"),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Stay connected with live scores, updates, and personalized content for all your favorite sports.",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/onBoading2.png"),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get real-time scores and instant notifications for every game and match.",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/onBoading3.png"),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Enjoy news, highlights, and community discussions customized to your interests.",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "SKIP",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginScanner();
                            }),
                          );
                        },
                        /*
                      onTap: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('onboardingShown', true);
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return LoginScanner();
                          }),
                        );
                      },
                      */
                        child: Text(
                          "DONE",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
