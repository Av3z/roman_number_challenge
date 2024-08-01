import 'package:flutter_test/flutter_test.dart';
import 'package:roman_number_challenge/src/services/number_converter.dart';
import 'package:roman_number_challenge/src/interfaces/inumber.dart';
import 'package:roman_number_challenge/src/utils/number_to_roman.dart';
import 'package:roman_number_challenge/src/utils/number_util.dart';
import 'package:roman_number_challenge/src/utils/roman_to_number.dart';

INumber numberConverter =
    NumberConverter(NumberToRoman(), RomanToNumber(), NumberUtil());

void main() {
  test('o valor não pode ser nullo', () {
    var result = numberConverter.convert("I");

    expect(result, isNotNull);
  });

  test('o resultado deve  ser I', () {
    var result = numberConverter.convert("1");

    expect(result, equals("I"));
  });

  test('o resultado deve ser 1', () {
    var result = numberConverter.convert("I");

    expect(result, '1');
  });

  test('o resultado deve ser X', () {
    var result = numberConverter.convert("10");

    expect(result, 'X');
  });

  test('o resultado deve ser XII', () {
    var result = numberConverter.convert("12");

    expect(result, 'XII');
  });

  test('o resultado deve ser LXXVII', () {
    var result = numberConverter.convert("77");

    expect(result, 'LXXVII');
  });

  test('o resultado deve ser MDCCLXXVIII', () {
    var result = numberConverter.convert("1778");

    expect(result, 'MDCCLXXVIII');
  });

  test('o resultado deve ser 14', () {
    var result = numberConverter.convert("XIV");

    expect(result, '14');
  });

  test('o resultado deve ser 77', () {
    var result = numberConverter.convert("LXXVII");

    expect(result, '77');
  });

  test('o resultado deve ser 1778', () {
    var result = numberConverter.convert("MDCCLXXVIII");

    expect(result, '1778');
  });

  // Aqui foi muitoo interessante pq aqui quebrou o teste e o atual foi: 'MMMMMMMMMMMMMMMMMDCCLXXXVIII'
  // sendo que os numeros romanos só podem conter 3 Letras repetidas,
  // então aqui eu tive que estudar um pouco sobre numeros romanos e descobri que,
  // quando vc passa do 4000 vc começa usar um traço em cima das letras que seria,
  // o numero * 1000, por exemplo 4000 é IV com traço em cima (4 * 1000)
  test(
      'o resultado deve ser XVIIDCCLXXXVIII e não MMMMMMMMMMMMMMMMMDCCLXXXVIII',
      () {
    var result = numberConverter.convert("17788");

    expect(result, 'XVIIDCCLXXXVIII');
  });

  /*
    Nesse trecho também tive um grande problema, porém agora na parte inversa, tentei varias formas por 2 dias
    e achei a melhor forma, a atual manter um espaço, exemplo:
    XVII com traço em cima (17 * 1000) é 17000, porem o traço em cima não conseguimos colocar na sintaxe,
    foi ai que tentei diversas formas, colocando até mesmo um traço parecido, utilizando um unicode.
    Porém não ficou muito bom e o melhor resultado foi usar espaço para separar sempre q foi um numero
    multiplicado por 1000
  */
  test('o resultado deve ser 17788', () {
    var result = numberConverter.convert("XVII DCCLXXXVIII");

    expect(result, "17788");
  });
}
