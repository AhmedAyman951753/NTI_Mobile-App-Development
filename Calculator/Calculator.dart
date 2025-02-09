/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : Calculator.c
  * @brief          : Main program body
  * @author         : Ahmed Ayman
  ******************************************************************************
  * This code is a simple calculator to do the basic operations in mathematics
  * addition , substraction , multiplication and division.
  ******************************************************************************
  */
/* USER CODE END Header */

import 'dart:io';

double? calculator(double number_one, double number_two, String? operation) {
  switch (operation) {
    case '+':
      {
        return (number_one + number_two);
      }
      break;

    case '-':
      {
        return (number_one - number_two);
      }
      break;

    case '*':
      {
        return (number_one * number_two);
      }
      break;

    case '/':
      {
        if (number_two != 0) {
          return (number_one / number_two);
          break;
        } else {
          print("ZeroDivisionError");
        }
      }
    case null:
      {
        print("Null operation");
        break;
      }
  }
}

void main() {
  double? num1, num2, result;
  String? operation;
  print("Enter the first number : ");
  num1 = double.parse(stdin.readLineSync()!);
  print("Enter the second number : ");
  num2 = double.parse(stdin.readLineSync()!);
  print("Enter the operation : ");
  operation = stdin.readLineSync();
  result = calculator(num1, num2, operation);
  print('The result = $result');
}
