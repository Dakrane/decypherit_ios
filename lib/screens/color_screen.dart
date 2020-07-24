import 'package:decypherit/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    String _text = 'Choose your color palette';
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      padding: EdgeInsets.all(15.0),
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
          Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ColorBlock(
                        color1: Colors.black,
                        color2: Colors.white,
                        action: () {
                          setState(() {
                            mainColor = Colors.black;
                            accentColor = Colors.white;
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Colors.white,
                        color2: Colors.black,
                        action: () {
                          setState(() {
                            mainColor = Colors.white;
                            accentColor = Colors.black;
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Color(0xFF303952),
                        color2: Color(0xFFf5cd79),
                        action: () {
                          setState(() {
                            mainColor = Color(0xFF303952);
                            accentColor = Color(0xFFf5cd79);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ColorBlock(
                        color1: Colors.black,
                        color2: Color(0xFF01AD73),
                        action: () {
                          setState(() {
                            mainColor = Colors.black;
                            accentColor = Color(0xFF01AD73);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Colors.white,
                        color2: Color(0xFF303F9F),
                        action: () {
                          setState(() {
                            mainColor = Colors.white;
                            accentColor = Color(0xFF303F9F);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Color(0xFFdfe6e9),
                        color2: Color(0xFF00b894),
                        action: () {
                          setState(() {
                            mainColor = Color(0xFFdfe6e9);
                            accentColor = Color(0xFF00b894);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      ColorBlock(
                        color1: Colors.black,
                        color2: Color(0xFFf19066),
                        action: () {
                          setState(() {
                            mainColor = Colors.black;
                            accentColor = Color(0xFFf19066);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Colors.white,
                        color2: Color(0xFFe55039),
                        action: () {
                          setState(() {
                            mainColor = Colors.white;
                            accentColor = Color(0xFFe55039);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                      ColorBlock(
                        color1: Color(0xFF006266),
                        color2: Color(0xFFecf0f1),
                        action: () {
                          setState(() {
                            mainColor = Color(0xFF006266);
                            accentColor = Color(0xFFecf0f1);
                            _saveCurrentColorScheme();
                            Phoenix.rebirth(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
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
                    'BACK',
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

class ColorBlock extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Function action;

  ColorBlock({this.color1, this.color2, this.action});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(1, 1, 0, 1),
                  child: Container(
//                  height: 40.0,
//                  width: 40.0,
                    decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'M',
                        style: (TextStyle(
                          color: color2,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'A',
                    style: (TextStyle(
                      color: color1,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_saveCurrentColorScheme() async {
  final prefs = await SharedPreferences.getInstance();
  final key1 = 'main_color';
  final key2 = 'accent_color';

  final savedMainColor = mainColor.value;
  final savedAccentColor = accentColor.value;

  prefs.setInt(key1, savedMainColor);
  prefs.setInt(key2, savedAccentColor);
}
