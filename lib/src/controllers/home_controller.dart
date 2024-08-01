import 'package:flutter/material.dart';
import 'package:roman_number_challenge/src/services/number_converter.dart';
import 'package:roman_number_challenge/src/interfaces/inumber.dart';
import 'package:roman_number_challenge/src/utils/number_to_roman.dart';
import 'package:roman_number_challenge/src/utils/number_util.dart';
import 'package:roman_number_challenge/src/utils/roman_to_number.dart';

class HomeController {
  TextEditingController numberEC = TextEditingController();

  INumber numberConverter =
      NumberConverter(NumberToRoman(), RomanToNumber(), NumberUtil());

  ValueNotifier<String> number = ValueNotifier<String>("");

  void convert() {
    number.value = numberConverter.convert(numberEC.text);
  }
}
