import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DifficultyScreen extends StatefulWidget {
  @override
  _DifficultyScreenState createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  @override
  Widget build(BuildContext context) {
    String _text = 'Set difficulty';
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
            _text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: accentColor,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          FluidSlider(
            sliderColor: accentColor,
            labelsTextStyle: TextStyle(
              color: mainColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            valueTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            value: mix.toDouble(),
            onChanged: (double newValue) {
              setState(
                    () {
                  mix = newValue.toInt();
                },
              );
            },
            min: 1.0,
            max: 12.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              _saveMixedText();
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
                    'SET',
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

_saveMixedText() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'difficulty';
  final savedDifficulty = mix;
  prefs.setInt(key, savedDifficulty);
}
