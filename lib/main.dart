import 'package:decypherit/screens/difficulty_screen.dart';
import 'package:decypherit/screens/intro_screen.dart';
import 'package:decypherit/screens/rules_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'components/get_challenges.dart';
import 'components/local_challenges.dart';
import 'screens/choosing_screen.dart';
import 'screens/game_screen.dart';
import 'screens/starting_screen.dart';

void main() {
  runApp(
    Phoenix(
      child: DecypherIt(),
    ),
  );
}

//AdmobObserver admobObserver = AdmobObserver();

//control line v4
class DecypherIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      navigatorObservers: <NavigatorObserver>[admobObserver],
      initialRoute: '/intro',
      routes: {
        '/': (context) => StartingScreen(),
        '/game': (context) => GameScreen(),
        '/choose': (context) => ChoosingScreen(),
        '/difficulty': (context) => DifficultyScreen(),
        '/test': (context) => ChallengeList(),
        '/local': (context) => LocalChallengeList(),
        '/rules': (context) => RulesScreen(),
        '/intro': (context) => IntroScreen(),
      },
      theme: ThemeData(
        brightness: mainBrightness,
        canvasColor: Colors.transparent,
        accentColor: accentColor,
      ),
    );
  }
}

//class AdmobObserver extends RouteObserver<PageRoute<dynamic>> {
//  @override
//  void didPush(Route route, Route previousRoute) {
//    super.didPush(route, previousRoute);
//    if (route.settings.name == '/') {
//      _showBannerAd();
//      // show the banner when navigating to home screen
//      print(
//          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');
////      _showBannerAd();
//    } else {
//      myBanner.dispose();
////      _disposeBannerAd();
//      // hide the banner when navigating to another screen
//      print(
//          'YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY');
//
////      _myBanner.dispose();
//    }
//  }
//
//  @override
//  void didPop(Route route, Route previousRoute) {
//    super.didPop(route, previousRoute);
//    if (previousRoute.settings.name == '/') {
//      print(
//          'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ');
//
//      // show the banner again when returning back to the home screen
////      _showBannerAd();
//    }
//  }
//}
//
//void _showBannerAd() {
//  myBanner
//    ..load()
//    ..show(
//      anchorOffset: 0.0,
//      // Banner Position
//      anchorType: AnchorType.bottom,
//    );
//}
//
//void _disposeBannerAd() {
//  print("Calling disposeAd");
//  try {
//    myBanner?.dispose();
//    myBanner = null;
//  } catch (ex) {
//    print("banner dispose error");
//  }
//}
