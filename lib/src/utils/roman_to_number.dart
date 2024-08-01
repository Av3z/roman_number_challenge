import 'package:roman_number_challenge/src/enums/roman_number.dart';

class RomanToNumber {
  String convert(String roman) {
    int result = 0;

    // Função para obter o valor de um numeral romano usando a enum
    int getRomanValue(String romanChar) {
      return RomanNumeral.values
          .firstWhere(
              (element) => element.toString().split('.').last == romanChar)
          .value;
    }

    // Função para converter uma string de numeros romanos para um int
    int convertRomanPart(String romanPart) {
      int partResult = 0;
      int prevValue = 0;

      for (int i = romanPart.length - 1; i >= 0; i--) {
        int currentValue = getRomanValue(romanPart[i]);
        if (currentValue < prevValue) {
          partResult -= currentValue;
        } else {
          partResult += currentValue;
        }
        prevValue = currentValue;
      }

      return partResult;
    }

    int spaceIndex = roman.indexOf(' ');

    String firstPart = '';
    String secondPart = roman;

    if (spaceIndex != -1) {
      firstPart = roman.substring(0, spaceIndex).trim();
      secondPart = roman.substring(spaceIndex + 1).trim();
    }

    // multiplicando a primeira parte por 1000, que seria a parte com o traço em cima.
    if (firstPart.isNotEmpty) {
      result += convertRomanPart(firstPart) * 1000;
    }

    if (secondPart.isNotEmpty) {
      result += convertRomanPart(secondPart);
    }

    return result.toString();
  }
}
