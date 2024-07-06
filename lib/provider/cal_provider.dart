import 'package:demo_calculator/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider with ChangeNotifier {
  String _equation = "0";
  String _result = "0";
  double _equationFontSize = 48.0;
  double _resultFontSize = 38.0;
  Color _equationColor = AppColors.primaryColor;
  bool _isCalculated = false;

  String get equation => _equation;
  String get result => _result;
  double get equationFontSize => _equationFontSize;
  double get resultFontSize => _resultFontSize;
  Color get equationColor => _equationColor;
  bool get isCalculated => _isCalculated;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _equation = "0";
      _result = "0";
      _equationFontSize = 38.0;
      _resultFontSize = 48.0;
      _equationColor = AppColors.calculatedColor;
      _isCalculated = true;
    } else if (buttonText == "⌫") {
      _equationFontSize = 48.0;
      _resultFontSize = 38.0;
      _equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        _equation = "0";
      }
    } else if (buttonText == "=") {
      _equationFontSize = 38.0;
      _resultFontSize = 48.0;

      String expression = _equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        _result = "Error";
      }
      _isCalculated = true;
      _equationColor = AppColors.calculatedColor;
    } else {
      _equationFontSize = 48.0;
      _resultFontSize = 38.0;
      if ((buttonText == "×" ||
              buttonText == "÷" ||
              buttonText == "+" ||
              buttonText == "-") &&
          isCalculated) {
        _equation = result + buttonText;
        _isCalculated = false;
      } else if (equation == "0" || isCalculated) {
        _equation = buttonText;
        _isCalculated = false;
      } else {
        _equation = equation + buttonText;
      }
      _equationColor = AppColors.primaryColor;
    }
    notifyListeners();
  }
}
