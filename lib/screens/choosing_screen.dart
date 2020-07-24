import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:decypherit/components/text_mix.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextMix textMix = TextMix();

class ChoosingScreen extends StatelessWidget {
  build(context) {
    return MaterialApp(
      color: mainColor,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            backgroundColor: mainColor,
            child: Icon(
              Icons.arrow_back,
              color: accentColor,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
          body: TabBarView(
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
                                    print(categoryCode[index]);
                                    Navigator.pushNamed(context, '/test');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
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
                                      borderRadius: BorderRadius.circular(10.0),
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
    print(chosenCompleted);
  } else if (categoryCode[index] == 'tvChallenge') {
    chosenCompleted = prefs.getStringList('tv_completed');
    print(chosenCompleted);
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
