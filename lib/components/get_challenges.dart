import 'package:decypherit/components/text_mix.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextMix textMix = TextMix();

class ChallengeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: mainColor,
            child: AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  chosenCategory.length,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: 3,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                challengeNumber = index;
                                _saveCurrentChallengeNumber();
                                sourceText = chosenCategory[index];
                                textMix.textMix();
                                Navigator.pushNamed(context, '/game');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Visibility(
                                      visible: chosenCompleted[index] == 'true'
                                          ? true
                                          : false,
                                      child: Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.check,
                                            size: 35.0,
                                            color: mainColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 999,
                                      child: Center(
                                        child: Text(
                                          '#${index + 1}',
                                          style: TextStyle(
                                              color: mainColor,
                                              fontSize: 40.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: FloatingActionButton(
                      elevation: 5.0,
                      heroTag: 'back',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: accentColor,
                      child: Icon(
                        Icons.arrow_back,
                        color: mainColor,
                        size: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_saveCurrentChallengeNumber() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'challenge_number';
  final chalNum = challengeNumber;
  prefs.setInt(key, chalNum);
}
