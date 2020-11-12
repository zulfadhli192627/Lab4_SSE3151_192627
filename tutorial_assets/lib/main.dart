import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final player = AudioCache();
  var dice1 = 'assets/dice1.png';
  var dice2 = 'assets/dice1.png';
  dynamic diceList = [
    "assets/dice1.png",
    "assets/dice2.png",
    "assets/dice3.png",
    "assets/dice4.png",
    "assets/dice5.png",
    "assets/dice6.png",
  ];

  Random rnd1, rnd2;
  void changeImage1() {
    setState(() {
      int min = 0;
      int max = diceList.length - 1;
      rnd1 = new Random();
      int r = min + rnd1.nextInt(max - min);
      dice1 = diceList[r].toString();
    });
  }

  void changeImage2() {
    setState(() {
      int min = 0;
      int max = diceList.length - 1;
      rnd2 = new Random();
      int r = min + rnd2.nextInt(max - min);
      dice2 = diceList[r].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(onPhoneShake: () {
      player.play('diceRoll.mp3');
      changeImage1();
      changeImage2();
    });

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/newbackground.png'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Dice Simulator'),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(50),
                  alignment: Alignment(0, 0),
                  child: Image(
                    image: AssetImage('assets/diceeLogo.png'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("$dice1"),
                    Image.asset("$dice2"),
                  ],
                ),
                new Container(
                  padding: EdgeInsets.all(50),
                  child: RaisedButton(
                    onPressed: () {
                      player.play('diceRoll.mp3');
                      changeImage1();
                      changeImage2();
                    },
                    color: Colors.red[900],
                    child: Text('Roll',
                        style: GoogleFonts.lobster(
                            textStyle: TextStyle(fontSize: 48))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
