import 'package:flutter/material.dart';
import 'package:decypherit/variables.dart';
import 'package:decypherit/components/button.dart';
import 'package:decypherit/components/text_mix.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

TextMix textMixer = TextMix();

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
    defaultButtonColor();
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_downward,
              color: accentColor,
            ),
            onPressed: () {
              _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
              if (mix > 1) {
                mix--;
                setState(() {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  textMixer.textMix();
                });
              } else {
                _mixAlert(context);
                setState(() {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  textMixer.textMix();
                });
              }
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.save,
                color: accentColor,
              ),
              onPressed: () {
                _saveMixedText();
                _saveSourceText();
                Navigator.pushNamed(context, '/');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: mainColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = StopWatchTimer.getDisplayTime(value);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: TextStyle(
                          fontSize: 20,
                          color: accentColor,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      backgroundColor: mainColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                displayedText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: accentColor,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 230.0,
            color: mainColor,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTemplate(
                            letter: 'Q',
                            buttonColor: buttonColorQ,
                            textColor: textColorQ,
                            action: () {
                              setState(() {
                                buttonInput = 'q';
                                buttonColorQ = mainColor;
                                textColorQ = accentColor;
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'W',
                            buttonColor: buttonColorW,
                            textColor: textColorW,
                            action: () {
                              setState(() {
                                buttonInput = 'w';
                                buttonColorW = mainColor;
                                textColorW = accentColor;
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'E',
                            buttonColor: buttonColorE,
                            textColor: textColorE,
                            action: () {
                              setState(() {
                                buttonInput = 'e';
                                buttonColorE = mainColor;
                                textColorE = accentColor;
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'R',
                            buttonColor: buttonColorR,
                            textColor: textColorR,
                            action: () {
                              setState(() {
                                buttonInput = 'r';
                                buttonColorR = mainColor;
                                textColorR = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'T',
                            buttonColor: buttonColorT,
                            textColor: textColorT,
                            action: () {
                              setState(() {
                                buttonInput = 't';
                                buttonColorT = mainColor;
                                textColorT = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'Y',
                            buttonColor: buttonColorY,
                            textColor: textColorY,
                            action: () {
                              setState(() {
                                buttonInput = 'y';
                                buttonColorY = mainColor;
                                textColorY = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'U',
                            buttonColor: buttonColorU,
                            textColor: textColorU,
                            action: () {
                              setState(() {
                                buttonInput = 'u';
                                buttonColorU = mainColor;
                                textColorU = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'I',
                            buttonColor: buttonColorI,
                            textColor: textColorI,
                            action: () {
                              setState(() {
                                buttonInput = 'i';
                                buttonColorI = mainColor;
                                textColorI = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'O',
                            buttonColor: buttonColorO,
                            textColor: textColorO,
                            action: () {
                              setState(() {
                                buttonInput = 'o';
                                buttonColorO = mainColor;
                                textColorO = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'P',
                            buttonColor: buttonColorP,
                            textColor: textColorP,
                            action: () {
                              setState(() {
                                buttonInput = 'p';
                                buttonColorP = mainColor;
                                textColorP = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 15.0,
                        ),
                        ButtonTemplate(
                            letter: 'A',
                            buttonColor: buttonColorA,
                            textColor: textColorA,
                            action: () {
                              setState(() {
                                buttonInput = 'a';
                                buttonColorA = mainColor;
                                textColorA = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'S',
                            buttonColor: buttonColorS,
                            textColor: textColorS,
                            action: () {
                              setState(() {
                                buttonInput = 's';
                                buttonColorS = mainColor;
                                textColorS = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'D',
                            buttonColor: buttonColorD,
                            textColor: textColorD,
                            action: () {
                              setState(() {
                                buttonInput = 'd';
                                buttonColorD = mainColor;
                                textColorD = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'F',
                            buttonColor: buttonColorF,
                            textColor: textColorF,
                            action: () {
                              setState(() {
                                buttonInput = 'f';
                                buttonColorF = mainColor;
                                textColorF = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'G',
                            buttonColor: buttonColorG,
                            textColor: textColorG,
                            action: () {
                              setState(() {
                                buttonInput = 'g';
                                buttonColorG = mainColor;
                                textColorG = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'H',
                            buttonColor: buttonColorH,
                            textColor: textColorH,
                            action: () {
                              setState(() {
                                buttonInput = 'h';
                                buttonColorH = mainColor;
                                textColorH = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'J',
                            buttonColor: buttonColorJ,
                            textColor: textColorJ,
                            action: () {
                              setState(() {
                                buttonInput = 'j';
                                buttonColorJ = mainColor;
                                textColorJ = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'K',
                            buttonColor: buttonColorK,
                            textColor: textColorK,
                            action: () {
                              setState(() {
                                buttonInput = 'k';
                                buttonColorK = mainColor;
                                textColorK = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'L',
                            buttonColor: buttonColorL,
                            textColor: textColorL,
                            action: () {
                              setState(() {
                                buttonInput = 'l';
                                buttonColorL = mainColor;
                                textColorL = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        SizedBox(
                          width: 15.0,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 50.0,
                        ),
                        ButtonTemplate(
                            letter: 'Z',
                            buttonColor: buttonColorZ,
                            textColor: textColorZ,
                            action: () {
                              setState(() {
                                buttonInput = 'z';
                                buttonColorZ = mainColor;
                                textColorZ = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'X',
                            buttonColor: buttonColorX,
                            textColor: textColorX,
                            action: () {
                              setState(() {
                                buttonInput = 'x';
                                buttonColorX = mainColor;
                                textColorX = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'C',
                            buttonColor: buttonColorC,
                            textColor: textColorC,
                            action: () {
                              setState(() {
                                buttonInput = 'c';
                                buttonColorC = mainColor;
                                textColorC = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'V',
                            buttonColor: buttonColorV,
                            textColor: textColorV,
                            action: () {
                              setState(() {
                                buttonInput = 'v';
                                buttonColorV = mainColor;
                                textColorV = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'B',
                            buttonColor: buttonColorB,
                            textColor: textColorB,
                            action: () {
                              setState(() {
                                buttonInput = 'b';
                                buttonColorB = mainColor;
                                textColorB = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'N',
                            buttonColor: buttonColorN,
                            textColor: textColorN,
                            action: () {
                              setState(() {
                                buttonInput = 'n';
                                buttonColorN = mainColor;
                                textColorN = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        ButtonTemplate(
                            letter: 'M',
                            buttonColor: buttonColorM,
                            textColor: textColorM,
                            action: () {
                              setState(() {
                                buttonInput = 'm';
                                buttonColorM = mainColor;
                                textColorM = accentColor;
                                print(buttonInput);
                                letterSwitch(buttonInput, context);
                              });
                            }),
                        SizedBox(
                          width: 50.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_mixAlert(context) {
  Alert(
    context: context,
    style: AlertStyle(
      animationType: AnimationType.grow,
      backgroundColor: mainColor,
      titleStyle: TextStyle(
          color: accentColor, fontSize: 30.0, fontWeight: FontWeight.bold),
      descStyle: TextStyle(color: accentColor, fontSize: 25.0),
    ),
    title: "Take it easy.",
    desc:
    "You can't make the game easier. This is the easiest difficulty. Mixing up the sentence...",
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

_winAlert(context) {
  Alert(
    context: context,
    style: AlertStyle(
      animationType: AnimationType.grow,
      backgroundColor: mainColor,
      titleStyle: TextStyle(
          color: accentColor, fontSize: 30.0, fontWeight: FontWeight.bold),
      descStyle: TextStyle(color: accentColor, fontSize: 25.0),
    ),
    title: "You've won!",
    desc: "Good job on completing the challenge!",
    buttons: [
      DialogButton(
        child: Text(
          "Stay",
          style: TextStyle(
              color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => Navigator.pop(context),
        color: accentColor,
      ),
      DialogButton(
        child: Text(
          "Go Home",
          style: TextStyle(
              color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: () => Navigator.pushNamed(context, '/'),
        color: accentColor,
      ),
    ],
  ).show();
}

void letterSwitch(buttonInput, context) {
  if (button1 == '') {
    button1 = buttonInput;
  } else {
    button2 = buttonInput;
    defaultButtonColor();
    for (var i = 0; i < displayedLetters.length; i++) {
      if (displayedLetters[i] == button1) {
        displayedLetters[i] = button2;
      } else if (displayedLetters[i] == button2) {
        displayedLetters[i] = button1;
      } else if (displayedLetters[i] == button1.toUpperCase()) {
        displayedLetters[i] = button2.toUpperCase();
      } else if (displayedLetters[i] == button2.toUpperCase()) {
        displayedLetters[i] = button1.toUpperCase();
      }
    }
    button1 = '';
    button2 = '';
  }

  displayedText = displayedLetters.join('');
  print(displayedText);

  _saveMixedText();

  if (displayedText == sourceText) {
    if (currChallengeCat == 'movieChallenge') {
      movieCompleted[challengeNumber] = 'true';
      _saveCompletedList('movie_completed', movieCompleted);
    } else if (currChallengeCat == 'tvChallenge') {
      tvCompleted[challengeNumber] = 'true';
      _saveCompletedList('tv_completed', tvCompleted);
    } else if (currChallengeCat == 'gameChallenge') {
      gameCompleted[challengeNumber] = 'true';
      _saveCompletedList('game_completed', gameCompleted);
    } else if (currChallengeCat == 'classicChallenge') {
      classicCompleted[challengeNumber] = 'true';
      _saveCompletedList('classic_completed', classicCompleted);
    } else if (currChallengeCat == 'musicChallenge') {
      musicCompleted[challengeNumber] = 'true';
      _saveCompletedList('music_completed', musicCompleted);
    } else if (currChallengeCat == 'techChallenge') {
      techCompleted[challengeNumber] = 'true';
      _saveCompletedList('tech_completed', techCompleted);
    }
    _winAlert(context);
  }
}

_saveMixedText() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'continue_mix_key';
  final challengeValue = displayedText;
  prefs.setString(key, challengeValue);
}

_saveSourceText() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'continue_source_key';
  final challengeValue = sourceText;
  prefs.setString(key, challengeValue);
}

_saveCompletedList(String listKey, List savedChallenge) async {
  final prefs = await SharedPreferences.getInstance();
  final key = listKey;
  final savedList = savedChallenge;
  prefs.setStringList(key, savedList);
}
