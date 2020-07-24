import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pit_slider_carousel/pit_slider_carousel.dart';

class RulesScreen extends StatefulWidget {
  @override
  _RulesScreenState createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'RULES',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            color: accentColor,
            height: 5.0,
          ),
          _buildCarousel(),
          SizedBox(
            height: 25.0,
          ),
          Divider(
            color: accentColor,
            height: 5.0,
          ),
          SizedBox(
            height: 25.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCarousel() {
  List<CarouselItem> list = [];
  List<String> rules = [
    'Welcome to the game \'decypher it\', where you need to figure out what sentence was encrypted to win the game.',
    'In this game some letters in a sentence are switched. Amount of letters depends on your difficulty. ',
        'You can lower the difficulty and re-mix the letters in the top-right of the screen of the game, if needed.',
    'Point of the game is to come to the source sentence through switching letters.',
    'You can continue your previous game if you\'ve already started solving a challenge.',
    'You can choose a challenge from categorised pre-loaded challenges or your own added before challenges.',
    'You can play with friends and create your own sentences for your friends to guess.',
    'In the settings menu you can change difficulty, delete your own challenges that you don\'t need anymore or change color palette.',
    'Have fun!',
  ];
  for (int i = 0; i < 8; i++) {
    list.add(
      CarouselItem(
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            color: mainColor,
            child: Center(
              child: Text(
                rules[i],
                style: TextStyle(
                  fontSize: 25.0,
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  var ctrl = CarouselController(carouselItems: list);

  return new PitSliderCarousel(
      height: 150.0,
      maxDotsIndicator: 8,
      dotSize: 8.0,
      activeDotColor: accentColor,
      dotColor: Colors.blueGrey,
      useDot: true,
      animationCurve: Curves.ease,
      autoPlay: false,
      dotPosition: Position(bottom: -10.0),
      carouselController: ctrl);
}
