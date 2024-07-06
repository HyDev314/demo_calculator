import 'package:demo_calculator/constant/app_colors.dart';
import 'package:demo_calculator/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorHomePage extends StatelessWidget {
  const CalculatorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);

    Widget buildButton(String buttonText, double buttonHeight,
        Color buttonColor, Color textColor) {
      return SizedBox(
        height: (MediaQuery.of(context).size.height - 40) * 0.1 * buttonHeight,
        width: 75,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(
                color: Colors.grey[100]!,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            shadowColor: Colors.grey,
            padding: const EdgeInsets.all(15.0),
          ),
          onPressed: () => calculator.buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          )
        ],
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 50),
              child: Text(calculator.equation,
                  style: TextStyle(
                      fontSize: calculator.equationFontSize,
                      color: calculator.equationColor)),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight,
              child: Text("= ${calculator.result}",
                  style: TextStyle(fontSize: calculator.resultFontSize)),
            ),
            const Spacer(),
            SizedBox(
              height: 430,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("C", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton(
                          "7", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "4", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "1", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton("00", 1, AppColors.whiteColor,
                          AppColors.primaryColor),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("⌫", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton(
                          "8", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "5", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "2", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "0", 1, AppColors.whiteColor, AppColors.primaryColor),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("÷", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton(
                          "9", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "6", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          "3", 1, AppColors.whiteColor, AppColors.primaryColor),
                      buildButton(
                          ".", 1, AppColors.whiteColor, AppColors.primaryColor),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildButton("×", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton("-", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton("+", 1, AppColors.whiteColor,
                          AppColors.secondaryColor),
                      buildButton("=", 2.15, AppColors.secondaryColor,
                          AppColors.whiteColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
