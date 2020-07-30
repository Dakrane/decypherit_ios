import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

String title = 'decypher it';
String upperLetter = lowerLetters.join('').toUpperCase();
String sourceText;
String displayedText = sourceText;
String buttonInput;
String button1 = '';
String button2 = '';
String currChallengeCat;
const appID = 'ca-app-pub-8186404993574241~1428996191';
const adID1 = 'ca-app-pub-8186404993574241/8956202238';
const adID2 = 'ca-app-pub-8186404993574241/4485478332';

int mix = 6;
int challengeNumber;

bool continueVisible = false;

const List<String> lowerLetters = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];
List<String> upperLetters = upperLetter.split('');
List<String> displayedLetters = [];
List<String> sourceLetters = [];
List<String> chosenCategory;
List<String> chosenCompleted;
List<String> userChallenges = [];
List<String> movieChallenge = [];
List<String> movieCompleted = [];
List<String> tvChallenge = [];
List<String> tvCompleted = [];
List<String> gameChallenge = [];
List<String> gameCompleted = [];
List<String> classicChallenge = [];
List<String> classicCompleted = [];
List<String> musicChallenge = [];
List<String> musicCompleted = [];
List<String> techChallenge = [];
List<String> techCompleted = [];
List<String> categoryCode = [
  'movieChallenge',
  'tvChallenge',
  'gameChallenge',
  'classicChallenge',
  'musicChallenge',
  'techChallenge'
];
List<String> categoryName = [
  'MOVIES',
  'TV',
  'GAMES',
  'CLASSIC',
  'MUSIC',
  'SAYINGS'
];
List<bool> isChecked = [];

Color mainColor = Colors.black;
Color accentColor = Color(0xFF01AD73);

//Color mainColor = Color(0xFF303952);
//Color accentColor = Color(0xFFf5cd79);

Brightness mainBrightness = Brightness.dark;

Color buttonColorQ;
Color textColorQ;

Color buttonColorW;
Color textColorW;

Color buttonColorE;
Color textColorE;

Color buttonColorR;
Color textColorR;

Color buttonColorT;
Color textColorT;

Color buttonColorY;
Color textColorY;

Color buttonColorU;
Color textColorU;

Color buttonColorI;
Color textColorI;

Color buttonColorO;
Color textColorO;

Color buttonColorP;
Color textColorP;

Color buttonColorA;
Color textColorA;

Color buttonColorS;
Color textColorS;

Color buttonColorD;
Color textColorD;

Color buttonColorF;
Color textColorF;

Color buttonColorG;
Color textColorG;

Color buttonColorH;
Color textColorH;

Color buttonColorJ;
Color textColorJ;

Color buttonColorK;
Color textColorK;

Color buttonColorL;
Color textColorL;

Color buttonColorZ;
Color textColorZ;

Color buttonColorX;
Color textColorX;

Color buttonColorC;
Color textColorC;

Color buttonColorV;
Color textColorV;

Color buttonColorB;
Color textColorB;

Color buttonColorN;
Color textColorN;

Color buttonColorM;
Color textColorM;

defaultButtonColor() {
  buttonColorQ = accentColor;
  textColorQ = mainColor;

  buttonColorW = accentColor;
  textColorW = mainColor;

  buttonColorE = accentColor;
  textColorE = mainColor;

  buttonColorR = accentColor;
  textColorR = mainColor;

  buttonColorT = accentColor;
  textColorT = mainColor;

  buttonColorY = accentColor;
  textColorY = mainColor;

  buttonColorU = accentColor;
  textColorU = mainColor;

  buttonColorI = accentColor;
  textColorI = mainColor;

  buttonColorO = accentColor;
  textColorO = mainColor;

  buttonColorP = accentColor;
  textColorP = mainColor;

  buttonColorA = accentColor;
  textColorA = mainColor;

  buttonColorS = accentColor;
  textColorS = mainColor;

  buttonColorD = accentColor;
  textColorD = mainColor;

  buttonColorF = accentColor;
  textColorF = mainColor;

  buttonColorG = accentColor;
  textColorG = mainColor;

  buttonColorH = accentColor;
  textColorH = mainColor;

  buttonColorJ = accentColor;
  textColorJ = mainColor;

  buttonColorK = accentColor;
  textColorK = mainColor;

  buttonColorL = accentColor;
  textColorL = mainColor;

  buttonColorZ = accentColor;
  textColorZ = mainColor;

  buttonColorX = accentColor;
  textColorX = mainColor;

  buttonColorC = accentColor;
  textColorC = mainColor;

  buttonColorV = accentColor;
  textColorV = mainColor;

  buttonColorB = accentColor;
  textColorB = mainColor;

  buttonColorN = accentColor;
  textColorN = mainColor;

  buttonColorM = accentColor;
  textColorM = mainColor;
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>[
    'game',
    'games',
    'puzzle',
    'words',
    'question',
    'smart',
  ], //Game, Puzzle, Words, Smart, Question
//  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender
      .unknown, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);
