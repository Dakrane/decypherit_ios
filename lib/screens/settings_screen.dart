import 'package:decypherit/screens/color_screen.dart';
import 'package:decypherit/screens/delete_screen.dart';
import 'package:decypherit/screens/difficulty_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          Center(
            child: Text(
              'SETTINGS',
              style: TextStyle(
                  color: accentColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: ColorScreen(),
                      )));
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
                    'CHANGE COLOR THEME',
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
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              if (userChallenges == [] && userChallenges.length == 0) {
                _deleteAlert(context);
              } else {
                isChecked = [];
                for (int i = 0; i < userChallenges.length; i++) {
                  isChecked.add(false);
                }
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                            child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: DeleteScreen(),
                        )));
              }
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
                    'DELETE USER CHALLENGE',
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
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                          child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: DifficultyScreen(),
                      )));
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
                    'DIFFICULTY',
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
          SizedBox(
            height: 10.0,
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
                    'CLOSE',
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

_deleteAlert(context) {
  Alert(
    context: context,
    style: AlertStyle(
      animationType: AnimationType.grow,
      backgroundColor: mainColor,
      titleStyle: TextStyle(
          color: accentColor, fontSize: 30.0, fontWeight: FontWeight.bold),
      descStyle: TextStyle(color: accentColor, fontSize: 25.0),
    ),
    title: "Sorry!",
    desc: "There is nothing to delete.",
    buttons: [
      DialogButton(
        child: Text(
          "OK",
          style: TextStyle(
              color: mainColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        onPressed: () => Navigator.pop(context),
        color: accentColor,
      ),
    ],
  ).show();
}
