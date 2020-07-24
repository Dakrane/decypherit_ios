import 'package:flutter/material.dart';
import 'package:decypherit/variables.dart';
import 'package:decypherit/components/text_mix.dart';
import '../variables.dart';

TextMix textMix = TextMix();

class UserChoosing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chosenCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap: () {
//              sourceText = chosenCategory[index].challengeText;
              textMix.textMix();
              Navigator.pushNamed(context, '/game');
            },
            child: Container(
                height: 70.0,
                decoration: BoxDecoration(),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: new Container(
                                color: mainColor,
                                child: Text(
                                  'chosenCategory[index].challengeTitle',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
