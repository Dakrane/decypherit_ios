import 'package:decypherit/variables.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteScreen extends StatefulWidget {
  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'DELETE CHALLENGE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: accentColor,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 400.0,
            child: ListView.builder(
                itemCount: userChallenges.length,
                itemBuilder: (context, int index) {
                  return new Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  userChallenges[index],
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 20.0,
//                                fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor: mainColor,
                              ),
                              child: Checkbox(
                                activeColor: mainColor,
                                checkColor: accentColor,
                                value: isChecked[index],
                                onChanged: (checkboxState) {
                                  setState(() {
                                    isChecked[index] = checkboxState;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  );
                }),
          ),
          SizedBox(
            height: 15.0,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                for (int d = userChallenges.length - 1; d >= 0; d--) {
                  if (isChecked[d] == true) {
                    userChallenges.removeAt(d);
                  }
                }
                for (int i = 0; i < userChallenges.length; i++) {
                  isChecked[i] = false;
                }
                _saveCurrentUserList();
                Navigator.pop(context);
              });
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'DELETE & QUIT',
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
    );
  }
}

_saveCurrentUserList() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'userChallenge';
  final savedList = userChallenges;
  prefs.setStringList(key, savedList);
}
