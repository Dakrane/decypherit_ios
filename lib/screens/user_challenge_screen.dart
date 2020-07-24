import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:decypherit/components/text_mix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserChallengeScreen extends StatefulWidget {
  @override
  _UserChallengeScreenState createState() => _UserChallengeScreenState();
}

TextMix textMix = TextMix();

class _UserChallengeScreenState extends State<UserChallengeScreen> {
  String _challengeText;

  @override
  Widget build(BuildContext context) {
    String _text = 'Enter yout text';

    return Container(
      color: mainColor,
      child: Container(
        padding: EdgeInsets.fromLTRB(1, 1, 1, 0),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: accentColor,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
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
                  sourceText = _challengeText;
                  textMix.textMix();
                  Navigator.pushNamed(context, '/game');
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              GestureDetector(
                onTap: () {
                  userChallenges.add(_challengeText);
                  _saveList();
                  sourceText = _challengeText;
                  textMix.textMix();
                  Navigator.pushNamed(context, '/game');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'START',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

_saveList() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'userChallenge';
  final savedList = userChallenges;
  prefs.setStringList(key, savedList);
}
