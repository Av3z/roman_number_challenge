class NumberUtil {
  // Aqui eu verifico se o input é um número romano utilizando regex;
  bool isRoman(String input) {
    final romanPattern =
        RegExp(r'^(?!.* {2})(?!.* $)(?!.*^ )^[IVXLCDM]+( [IVXLCDM]+)*$');
    return romanPattern.hasMatch(input.toUpperCase());
  }
}
