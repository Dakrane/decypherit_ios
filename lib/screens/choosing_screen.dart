import 'package:decypherit/components/text_mix.dart';
import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';

TextMix textMix = TextMix();

class ChoosingScreen extends StatelessWidget {
  build(context) {
    return MaterialApp(
      color: mainColor,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
//          floatingActionButton: FloatingActionButton(
//            onPressed: () {
//              Navigator.pop(context);
//            },
//            backgroundColor: accentColor,
//            child: Icon(
//              Icons.arrow_back,
//              color: mainColor,
//            ),
//          ),
//          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          resizeToAvoidBottomPadding: false,
          appBar: ShiftingTabBar(
            color: mainColor,
            labelStyle: TextStyle(
              color: accentColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              ShiftingTab(
                icon: Icon(
                  Icons.menu,
                  color: accentColor,
                  size: 30.0,
                ),
                text: "Category",
              ),
              ShiftingTab(
                icon: Icon(
                  Icons.person,
                  color: accentColor,
                  size: 30.0,
                ),
                text: "User",
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: [
                  Container(
                    color: mainColor,
                    child: AnimationLimiter(
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          categoryName.length,
                          (int index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 350),
                              columnCount: 2,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        _readList(categoryCode[index]);
                                        _readCompleted(index);
                                        currChallengeCat = categoryCode[index];
                                        _saveCurrentChallengeCategory();
                                        Navigator.pushNamed(context, '/test');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            categoryName[index],
                                            style: TextStyle(
                                                color: mainColor,
                                                fontSize: 40.0,
                                                fontWeight: FontWeight.bold),
                                          ),
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
                  Container(
                    color: mainColor,
                    child: AnimationLimiter(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          userChallenges.length,
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
                                        sourceText = userChallenges[index];
                                        textMix.textMix();
                                        Navigator.pushNamed(context, '/game');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '#${index + 1}',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontSize: 45.0,
                                                fontWeight: FontWeight.bold),
                                          ),
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
                ],
              ),
              Visibility(
                visible: true,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 30.0),
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
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 30.0),
                          child: FloatingActionButton(
                            elevation: 5.0,
                            heroTag: 'add',
                            onPressed: () {
                              _userChallengeAlert(context);
                            },
                            backgroundColor: accentColor,
                            child: Icon(
                              Icons.add,
                              color: mainColor,
                              size: 35.0,
                            ),
                          ),
                        ),
                      ],
                    ),
//                    FloatingActionButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_readList(String listKey) async {
  final prefs = await SharedPreferences.getInstance();
  final key = listKey;
  final value = prefs.getStringList(key);
  chosenCategory = value;
}

_readCompleted(index) async {
  final prefs = await SharedPreferences.getInstance();
  if (categoryCode[index] == 'movieChallenge') {
    chosenCompleted = prefs.getStringList('movie_completed');
  } else if (categoryCode[index] == 'tvChallenge') {
    chosenCompleted = prefs.getStringList('tv_completed');
  } else if (categoryCode[index] == 'gameChallenge') {
    chosenCompleted = prefs.getStringList('game_completed');
  } else if (categoryCode[index] == 'classicChallenge') {
    chosenCompleted = prefs.getStringList('classic_completed');
  } else if (categoryCode[index] == 'musicChallenge') {
    chosenCompleted = prefs.getStringList('music_completed');
  } else if (categoryCode[index] == 'techChallenge') {
    chosenCompleted = prefs.getStringList('tech_completed');
  }
}

_saveCurrentChallengeCategory() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'challenge_category';
  final value = currChallengeCat;
  prefs.setString(key, value);
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
