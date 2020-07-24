import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:decypherit/variables.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

final _firestore = Firestore.instance;

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _getData();
    _readSavedData();
    delayTime();
  }

  void delayTime() async {
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        Navigator.pushNamed(context, '/');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TypewriterAnimatedTextKit(
          text: ['decypher it'],
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

void _getData() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      _readCompletedData();
      movieChallenge = [];
      tvChallenge = [];
      gameChallenge = [];
      classicChallenge = [];
      musicChallenge = [];
      techChallenge = [];
      List<String> _movieC = [];
      List<String> _tvC = [];
      List<String> _gamesC = [];
      List<String> _classicC = [];
      List<String> _musicC = [];
      List<String> _techC = [];

      _firestore.collection('movieChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              movieChallenge.add(result.data['text']);
              _movieC.add('false');
              if (_movieC.length > movieCompleted.length) {
                movieCompleted = _movieC;
                _saveList('movieChallenge', movieChallenge);
                _saveList('movie_completed', movieCompleted);
              }
            },
          );
        },
      );

      _firestore.collection('tvChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              tvChallenge.add(result.data['text']);
              _tvC.add('false');
              _saveList('tvChallenge', tvChallenge);
              if (_tvC.length > tvCompleted.length) {
                tvCompleted = _tvC;
                _saveList('tv_completed', tvCompleted);
              }
            },
          );
        },
      );

      _firestore.collection('gameChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              gameChallenge.add(result.data['text']);
              _gamesC.add('false');
              _saveList('gameChallenge', gameChallenge);
              if (_gamesC.length > gameCompleted.length) {
                gameCompleted = _gamesC;
                _saveList('game_completed', gameCompleted);
              }
            },
          );
        },
      );

      _firestore.collection('classicChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              classicChallenge.add(result.data['text']);
              _classicC.add('false');
              _saveList('classicChallenge', classicChallenge);
              if (_classicC.length > classicCompleted.length) {
                classicCompleted = _classicC;
                _saveList('classic_completed', classicCompleted);
              }
            },
          );
        },
      );

      _firestore.collection('musicChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              musicChallenge.add(result.data['text']);
              _musicC.add('false');
              _saveList('musicChallenge', musicChallenge);
              if (_musicC.length > musicCompleted.length) {
                musicCompleted = _musicC;
                _saveList('music_completed', musicCompleted);
              }
            },
          );
        },
      );

      _firestore.collection('techChallenge').getDocuments().then(
            (querySnapshot) {
          querySnapshot.documents.forEach(
                (result) {
              techChallenge.add(result.data['text']);
              _techC.add('false');
              _saveList('techChallenge', techChallenge);
              if (_techC.length > techCompleted.length) {
                techCompleted = _techC;
                _saveList('tech_completed', techCompleted);
              }
            },
          );
        },
      );
    }
  } on SocketException catch (_) {
//    print('not connected');
  }
}

_saveList(String listKey, List savedChallenge) async {
  final prefs = await SharedPreferences.getInstance();
  final key = listKey;
  final savedList = savedChallenge;
  prefs.setStringList(key, savedList);
}

_readSavedData() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getStringList('userChallenge') ??
      ['First user challenge. Others are up to you!'];
  userChallenges = value;

  final prefs2 = await SharedPreferences.getInstance();
  final diff = prefs2.getInt('difficulty') ?? 6;
  mix = diff;

  final prefs3 = await SharedPreferences.getInstance();
  final mainSavedColor = prefs3.getInt('main_color');
  final accentSavedColor = prefs3.getInt('accent_color');
  mainColor = Color(mainSavedColor);
  accentColor = Color(accentSavedColor);

  final prefs4 = await SharedPreferences.getInstance();
  final savedDisplayedText = prefs4.getString('continue_mix_key');
  displayedText = savedDisplayedText;
  displayedLetters = displayedText.split('');

  final prefs5 = await SharedPreferences.getInstance();
  final savedSourceText = prefs5.getString('continue_source_key');
  sourceText = savedSourceText;
}

_readCompletedData() async {
  final prefs1 = await SharedPreferences.getInstance();
  final value1 = prefs1.getStringList('movie_completed') ?? ['false'];
  movieCompleted = value1;

  final prefs2 = await SharedPreferences.getInstance();
  final value2 = prefs2.getStringList('tv_completed') ?? ['false'];
  tvCompleted = value2;

  final prefs3 = await SharedPreferences.getInstance();
  final value3 = prefs3.getStringList('game_completed') ?? ['false'];
  gameCompleted = value3;

  final prefs4 = await SharedPreferences.getInstance();
  final value4 = prefs4.getStringList('classic_completed') ?? ['false'];
  classicCompleted = value4;

  final prefs5 = await SharedPreferences.getInstance();
  final value5 = prefs5.getStringList('music_completed') ?? ['false'];
  musicCompleted = value5;

  final prefs6 = await SharedPreferences.getInstance();
  final value6 = prefs6.getStringList('tech_completed') ?? ['false'];
  techCompleted = value6;
}
