import 'package:decypherit/variables.dart';
import 'dart:math';

class TextMix {
  void textMix() {
//    textColor = mainColor;
    displayedLetters = sourceText.split('');
    String noSpace = sourceText.toLowerCase();
    noSpace = noSpace.replaceAll(' ', '');
    noSpace = noSpace.replaceAll('.', '');
    noSpace = noSpace.replaceAll(',', '');
    noSpace = noSpace.replaceAll('-', '');
    noSpace = noSpace.replaceAll(':', '');
    noSpace = noSpace.replaceAll(';', '');
    noSpace = noSpace.replaceAll('!', '');
    noSpace = noSpace.replaceAll('?', '');
    noSpace = noSpace.replaceAll('\'', '');
    noSpace = noSpace.replaceAll('0', '');
    noSpace = noSpace.replaceAll('1', '');
    noSpace = noSpace.replaceAll('2', '');
    noSpace = noSpace.replaceAll('3', '');
    noSpace = noSpace.replaceAll('4', '');
    noSpace = noSpace.replaceAll('5', '');
    noSpace = noSpace.replaceAll('6', '');
    noSpace = noSpace.replaceAll('7', '');
    noSpace = noSpace.replaceAll('8', '');
    noSpace = noSpace.replaceAll('9', '');
    sourceLetters = noSpace.split('');

    for (int m = 1; m <= mix; m++) {
      String randomString1 =
      sourceLetters[Random().nextInt(sourceLetters.length)];
      String randomString2 = lowerLetters[Random().nextInt(24)];

      for (int a = 0; a < displayedLetters.length; a++) {
        if (displayedLetters[a] == randomString1 ||
            displayedLetters[a] == randomString1.toUpperCase()) {
          if (displayedLetters[a] == randomString1) {
            displayedLetters[a] = randomString2;
          } else if (displayedLetters[a] == randomString1.toUpperCase()) {
            displayedLetters[a] = randomString2.toUpperCase();
          }
        } else if (displayedLetters[a] == randomString2 ||
            displayedLetters[a] == randomString2.toUpperCase()) {
          if (displayedLetters[a] == randomString2) {
            displayedLetters[a] = randomString1;
          } else if (displayedLetters[a] == randomString2.toUpperCase()) {
            displayedLetters[a] = randomString1.toUpperCase();
          }
        }

        displayedText = displayedLetters.join('');
      }
    }
  }
}
