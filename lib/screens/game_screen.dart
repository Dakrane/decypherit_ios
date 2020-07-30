import 'package:auto_size_text/auto_size_text.dart';
import 'package:decypherit/components/button.dart';
import 'package:decypherit/components/text_mix.dart';
import 'package:decypherit/variables.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    FirebaseAdMob.instance.initialize(appId: appID);
    gameBannerAd = buildBanner()..load();
  }

  BannerAd gameBannerAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.fullBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            gameBannerAd..show(anchorType: AnchorType.top);
          } else if (event == MobileAdEvent.failedToLoad) {
            gameBannerAd..load();
          } else {
            print(event);
          }
        });
  }

  void dispose() async {
    gameBannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: mainColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 90.0,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: AutoSizeText(
                  displayedText,
                  textAlign: TextAlign.center,
                  maxLines: 7,
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    _saveMixedText();
                    _saveSourceText();
                    try {
                      gameBannerAd?.dispose();
                      gameBannerAd = null;
                    } catch (ex) {
                      print("banner dispose error $ex");
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: mainColor,
                    child: Icon(
                      Icons.save,
                      color: accentColor,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                child: GestureDetector(
                  onTap: () {
                    if (mix > 1) {
                      mix--;
                      setState(() {
                        textMixer.textMix();
                      });
                    } else {
                      _mixAlert(context);
                      setState(() {
                        textMixer.textMix();
                      });
                    }
                  },
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: mainColor,
                    child: Icon(
                      Icons.arrow_downward,
                      color: accentColor,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 4,
            child: Container(
//              height: 230.0,
              padding: EdgeInsets.all(20.0),
              color: mainColor,
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
