/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : Theater Booking System.dart
  * @brief          : Main program body
  * @author         : Ahmed Ayman
  ******************************************************************************
  * This code is a systme for theater seats booking. It is about to make the 
    user choose between some options include booking new seat , show seats ,
    show users data and exit from the program
  ******************************************************************************
  */
/* USER CODE END Header */

import 'dart:io';

int row = 10;
int column = 10;
int chosenRow = 0, chosenColumn = 0;
String? name, phone;
List<List<String>> seats = List<List<String>>.generate(
    row, (int i) => List<String>.generate(column, (int j) => 'E'));
Map<String, dynamic> usersData = {};

void displayMenu() {
  print("press 1 to show the theater seats");
  print("press 2 to book new seat");
  print("press 3 to show users data");
  print("press 4 to exit");
}

int inputWithValidate(
    {String promot = 'Number', required int max, int min = 1}) {
  while (true) {
    print("Enter valid $promot from $min to $max");
    String? option = stdin.readLineSync();
    if (option == null) {
      continue;
    } else {
      int? input = int.tryParse(option);
      if (input == null) {
        continue;
      } else {
        if ((input >= min) && (input <= max)) {
          return input;
        } else {
          print("Out of range!!");
          continue;
        }
      }
    }
  }
}

void displaySeats() {
  for (var row in seats) {
    print(row.join(' '));
  }
}

void bookSeat() {
  chosenRow = inputWithValidate(max: row, promot: 'row');
  chosenColumn = inputWithValidate(max: column, promot: 'column');
  if (seats[chosenRow - 1][chosenColumn - 1] == 'E') {
    print("Enter your name : ");
    name = stdin.readLineSync();
    print("Enter phone number : ");
    phone = stdin.readLineSync();
    print("Seat is booked successfully 👍🏻✅");
    seats[chosenRow - 1][chosenColumn - 1] = 'B';
    usersData.addAll({"Seat$chosenRow,$chosenColumn": "$name - $phone"});
    print("Seat$chosenRow,$chosenColumn" ":" "$name - $phone");
  } else {
    print("Seat is already booked!! Choose another seat.");
  }
}

void displayUsersData() {
  usersData.forEach((key, value) => print('$key : $value'));
}

void invalidOption() {
  print("Invalid Option!! Please try again.");
}

void main() {
  int input = 0;
  while (true) {
    print("Welcome to our theater!!\n");
    displayMenu();
    input = inputWithValidate(max: 4, promot: 'option');
    if (input == 1) {
      displaySeats();
    } else if (input == 2) {
      bookSeat();
    } else if (input == 3) {
      displayUsersData();
    } else if (input == 4) {
      print("See you back 👋🏻");
      break;
    } else {}
  }
}
