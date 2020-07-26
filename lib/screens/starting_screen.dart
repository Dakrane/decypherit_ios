import 'package:decypherit/screens/rules_screen.dart';
import 'package:decypherit/screens/settings_screen.dart';
import 'package:decypherit/screens/user_challenge_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:firebase_admob/firebase_admob.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    FirebaseAdMob.instance.initialize(appId: appID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: 800),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: RulesScreen(),
                                )));
                      },
                      child: Icon(
                        Icons.info,
                        color: accentColor,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 14,
            child: DelayedDisplay(
              delay: Duration(milliseconds: 680),
              child: Center(
                child: TypewriterAnimatedTextKit(
                  text: ['decypher it'],
                  textStyle: TextStyle(
                    color: accentColor,
                    fontSize: 55.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 550),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuButton(
                  buttonText: 'CONTINUE',
                  buttonAction: () {
//                    _readContinue();
                    if (displayedText == null) {
                      _continueAlert(context);
                    } else if (displayedText == sourceText) {
                      _completedAlert(context);
                    } else {
                      Navigator.pushNamed(context, '/game');
                    }
                  },
                ),
              ),
            ),
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 420),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuButton(
                  buttonText: 'CHOOSE',
                  buttonAction: () {
//                    Navigator.pushNam/ed(context, '/intro');
                    Navigator.pushNamed(context, '/choose');
                  },
                ),
              ),
            ),
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuButton(
                  buttonText: 'CREATE',
                  buttonAction: () {
                    _userChallengeAlert(context);
                  },
                ),
              ),
            ),
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 150),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuButton(
                  buttonText: 'SETTINGS',
                  buttonAction: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                              child: SettingsScreen(),
                            )));
                  },
                ),
              ),
            ),
          ),
          Center(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 50),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuButton(
                  buttonText: 'AD PLACE',
                  buttonAction: () {
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String buttonText;
  final Function buttonAction;

  MenuButton({this.buttonText, this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        height: 50.0,
        width: 245.0,
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: mainColor, fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

_continueAlert(context) {
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
    desc: "There is nothing to continue. Start a new game.",
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

_completedAlert(context) {
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
    desc: "You've already completed previous challenge. Start a new game.",
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

_userChallengeAlert(context) {
  String _challengeText;
  Alert(
    context: context,
    style: AlertStyle(
      isCloseButton: false,
      animationType: AnimationType.grow,
      backgroundColor: mainColor,
      titleStyle: TextStyle(
          color: accentColor, fontSize: 30.0, fontWeight: FontWeight.bold),
    ),
    title: "Enter your text",
    content: Container(
      width: 300.0,
      child: TextField(
        scrollPadding: EdgeInsets.all(5.0),
        autofocus: true,
        cursorWidth: 1.0,
        style: TextStyle(
          color: accentColor,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: (value) {
          _challengeText = value;
        },
        onEditingComplete: () {
          if (_challengeText != null) {
            sourceText = _challengeText;
            textMix.textMix();
            Navigator.pushNamed(context, '/game');
          } else {
            Navigator.pop(context);
          }
        },
      ),
    ),
//    desc: ".",
    buttons: [
      DialogButton(
        child: Text(
          "PLAY",
          style: TextStyle(
            color: mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          if (_challengeText != null) {
            userChallenges.add(_challengeText);
            _saveCurrentUserList();
            sourceText = _challengeText;
            textMix.textMix();
            Navigator.pushNamed(context, '/game');
          } else {
            Navigator.pop(context);
          }
        },
        color: accentColor,
      ),
    ],
  ).show();
}

_saveCurrentUserList() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'userChallenge';
  final savedList = userChallenges;
  prefs.setStringList(key, savedList);
}

//_readContinue() async {
//  final prefs = await SharedPreferences.getInstance();
//  final key1 = 'continue_mix_key';
//  final key2 = 'continue_source_key';
//
//  displayedText = prefs.getString(key1);
//  displayedLetters = displayedText.split('');
//
//  sourceText = prefs.getString(key2);
//  print(prefs.getString(key1));
//}
