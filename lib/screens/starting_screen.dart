import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:decypherit/screens/rules_screen.dart';
import 'package:decypherit/screens/settings_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:firebase_admob/firebase_admob.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    checkContinue();
//    FirebaseAdMob.instance.initialize(appId: appID);
  }

//  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//    keywords: <String>['flutterio', 'beautiful apps'],
//    contentUrl: 'https://flutter.io',
//    birthday: DateTime.now(),
//    childDirected: false,
//    designedForFamilies: false,
//    gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//    testDevices: <String>[], // Android emulators are considered test devices
//  );
//
//  BannerAd myBanner = BannerAd(
//    // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//    // https://developers.google.com/admob/android/test-ads
//    // https://developers.google.com/admob/ios/test-ads
//    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
//    size: AdSize.smartBanner,
//    targetingInfo: targetingInfo,
//    listener: (MobileAdEvent event) {
//      print("BannerAd event is $event");
//    },
//  );

  void checkContinue() {
    if (displayedText == null) {
      continueVisible = false;
    } else if (displayedText == sourceText) {
      continueVisible = false;
    } else {
      continueVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
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
            Visibility(
              visible: continueVisible ? true : false,
              child: Center(
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
            ),
            Center(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 420),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MenuButton(
                    buttonText: 'PLAY',
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: SettingsScreen(),
                              )));
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
          ],
        ),
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
