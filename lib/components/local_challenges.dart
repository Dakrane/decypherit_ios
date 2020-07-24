import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:decypherit/components/text_mix.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LocalChallengeList extends StatefulWidget {
  @override
  _LocalChallengeListState createState() => _LocalChallengeListState();
}

TextMix textMix = TextMix();

class _LocalChallengeListState extends State<LocalChallengeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'Choose a challenge',
          style: TextStyle(color: accentColor),
        ),
        centerTitle: true,
      ),
      body: AnimationLimiter(
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
                            color: mainColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              '#${index + 1}',
                              style:
                              TextStyle(color: accentColor, fontSize: 30.0),
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
    );
  }
}

//body: SafeArea(
//child: ListView.builder(
//itemCount: userChallenges.length,
//itemBuilder: (context, index) {
//return GestureDetector(
//onTap: () {
//sourceText = userChallenges[index];
//textMix.textMix();
//Navigator.pushNamed(context, '/game');
//},
//child: Padding(
//padding: EdgeInsets.all(8.0),
//child: Column(
//children: <Widget>[
//Container(
//height: 60.0,
//padding: EdgeInsets.only(left: 20.0, right: 20.0),
//decoration: BoxDecoration(
//color: mainColor,
//borderRadius: BorderRadius.circular(10.0),
//),
//child: new Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Expanded(
//child: new Container(
//color: mainColor,
//child: Text(
//'Challenge #${index + 1}',
//textAlign: TextAlign.center,
//style: TextStyle(
//fontSize: 25.0,
//color: Colors.white,
//fontWeight: FontWeight.bold),
//maxLines: 1,
//),
//),
//),
//],
//),
//),
//],
//),
//),
//);
//},
//),
//),
