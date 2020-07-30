import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:decypherit/screens/settings_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    FirebaseAdMob.instance.initialize(appId: appID);
    startingBannerAd = buildBanner()..load();
  }

  BannerAd startingBannerAd;

  BannerAd buildBanner() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.fullBanner,
        listener: (MobileAdEvent event) {
//        print(event);
          if (event == MobileAdEvent.loaded) {
            startingBannerAd..show(anchorType: AnchorType.top);
          } else if (event == MobileAdEvent.failedToLoad) {
            startingBannerAd..load();
          } else {
            print(event);
          }
        });
  }

  @override
  void dispose() {
    startingBannerAd?.dispose();
    super.dispose();
  }

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
//    startingBannerAd
//      ..load()
//      ..show(anchorType: AnchorType.top);
    return Scaffold(
      backgroundColor: mainColor,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 45.0),
              child: Column(
                children: <Widget>[
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
                              Navigator.pushNamed(context, '/game');
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
                            try {
                              startingBannerAd?.dispose();
                              startingBannerAd = null;
                            } catch (ex) {
                              print("banner dispose error $ex");
                            }
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/choose', (Route<dynamic> route) => false);
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
                ],
              ),
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
