import 'package:roman_number_challenge/src/interfaces/inumber.dart';
import 'package:roman_number_challenge/src/utils/number_to_roman.dart';
import 'package:roman_number_challenge/src/utils/number_util.dart';
import 'package:roman_number_challenge/src/utils/roman_to_number.dart';

/* 
  Aqui eu implemento o INumber para deixar o codigo 
  um pouco menos desacoplado, também faço a inversão de dependencia,
  deixar para ser passada as  instancias quando instanciar o NumberConverter

*/

class NumberConverter implements INumber {
  final NumberToRoman _intToRomanConverter;
  final RomanToNumber _romanToIntConverter;
  final NumberUtil _numberUtil;

  NumberConverter(
      this._intToRomanConverter, this._romanToIntConverter, this._numberUtil);

  @override
  String convert(dynamic input) {
    if (_numberUtil.isRoman(input)) {
      return _romanToIntConverter.convert(input);
    } else {
      return _intToRomanConverter.convert(int.parse(input));
    }
  }
}
