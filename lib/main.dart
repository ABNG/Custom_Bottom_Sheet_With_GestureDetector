import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_url_launcher/CustomGestureDetector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width;
  double height;
  bool isBottomShowing = false;
  double threshold = 100.0;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomGestureDetector(
      //replace gesture dector with custom gesture detector

      axis: CustomGestureDetector.AXIS_Y,
      velocity: threshold,
      onSwipeDown: () {
        setState(() {
          isBottomShowing = false;
        });
      },
      onSwipeUp: () {
        setState(() {
          isBottomShowing = true;
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(
                  horizontal: width / 3, vertical: height / 7),
              color: Colors.white,
              child: Text(
                "RPS",
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: isBottomShowing ? 1.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(
                    0.2), //use colors.transparent, if you don,t want container color.
              ),
            ),
          ),
          AnimatedPositioned(
              curve: Curves.easeInOut,
              bottom: isBottomShowing ? -140 : -(height / 2.5),
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 100),
              child: CustomBottomSheet()),
        ],
      ),
    ));
  }
}

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5 + 140,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.keyboard_arrow_up),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text(
              "Title",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              "sdlkjflkdjg ldfjglj dflgjdlg jldjgdfljglfdjgldfj lgjldfkjglkfdjl sdlkjflkdjg ldfjglj dflgjdlg jldjgdfljglfdjgldfj lgjldfkjglkfdjl sdlkjflkdjg ldfjglj dflgjdlg jldjgdfljglfdjgldfj lgjldfkjglkfdjl",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              label: Text(
                "Google",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              label: Text(
                "Google",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
