import 'package:roman_number_challenge/src/enums/roman_number.dart';

class NumberToRoman {
  String convert(int number) {
    /*
      Aqui é uma pequena verificação, 
      para não deixar com que o numero que venha não seja menor ou igual a 0,
      e acabar quebrando o código.
    */

    if (number <= 0) return "";

    String result = "";

    List<RomanNumeral> values = RomanNumeral.values.reversed.toList();

    /* 
      Aqui é o real desafio haha,tive que criar essa função a parte, 
      quando lembrei que numeros muito grande tinha uma linha em cima,
      que siginifava o numero X 1000, onde tive q fazer esse tratamento
      diferente e vou de alguma forma agora, tentar tratar na UI
    */

    if (number >= 4000) {
      int thousands = number ~/ 1000;
      number %= 1000;
      result += convert(thousands); // Aqui eu faço o uso da recursividade
    }

    /*
      Aqui eu estou  fazendo um for pela enum, e depois faço um loop,
      adicionando o valor romano e retirando o valor numerico.
    */

    for (var numeral in values) {
      while (number >= numeral.value) {
        result += numeral.name;
        number -= numeral.value;
      }
    }

    return result;
  }
}
