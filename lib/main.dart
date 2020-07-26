import 'package:decypherit/screens/difficulty_screen.dart';
import 'package:decypherit/screens/intro_screen.dart';
import 'package:decypherit/screens/rules_screen.dart';
import 'package:decypherit/screens/user_challenge_screen.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'components/get_challenges.dart';
import 'components/local_challenges.dart';
import 'screens/choosing_screen.dart';
import 'screens/game_screen.dart';
import 'screens/starting_screen.dart';
import 'screens/user_choosing_screen.dart';

void main() {
  runApp(
    Phoenix(
      child: DecypherIt(),
    ),
  );
}

//control line v2
class DecypherIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/intro',
      routes: {
        '/': (context) => StartingScreen(),
        '/game': (context) => GameScreen(),
        '/choose': (context) => ChoosingScreen(),
        '/difficulty': (context) => DifficultyScreen(),
        '/user': (context) => UserChallengeScreen(),
        '/userchoice': (context) => UserChoosing(),
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
