import 'dart:core';

bool isValidateEmail(String input) {
  RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)$");
  return emailRegExp.hasMatch(input);
}