import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  int _authPageIndex = 0;
  int get authPageIndex => _authPageIndex;

  bool _isAuthorized = false;
  bool get isAuthorized => _isAuthorized;

  String _authPageTitle = 'Войти';
  String get authPageTitle => _authPageTitle;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  TextEditingController registrationPasswordController = TextEditingController();

  bool isPasswordLenCorrect = false;
  bool hasLetterAndDigit = false;
  bool hasSpecialChar = false;

  changeAuthPage() {
    _authPageIndex = _authPageIndex == 0 ? 1 : 0;
    _authPageTitle = _authPageTitle == 'Войти' ? 'Зарегистрироваться' : 'Войти';
    notifyListeners();
  }

  changeAuthStatus() {
    _isAuthorized = _isAuthorized == false ? true : false;
    notifyListeners();
  }

  changePasswordVisibility() {
    _isPasswordVisible = _isPasswordVisible == false ? true : false;
    notifyListeners();
  }

  changeValidationState() {
    String password = registrationPasswordController.text;
    if (
      password.length > 7
      && password.length <= 20
    ) {
      isPasswordLenCorrect = true;
    } else {
      isPasswordLenCorrect = false;
    }

    bool hasLetter = RegExp(r'[a-zA-Z]').hasMatch(password);
    bool hasDigit = RegExp(r'[0-9]').hasMatch(password);
    if (hasDigit && hasLetter) {
      hasLetterAndDigit = true;
    } else {
      hasLetterAndDigit = false;
    }

    if (RegExp(r'[#!?$&@%]').hasMatch(password)) {
      hasSpecialChar = true;
    } else {
      hasSpecialChar = false;
    }
    notifyListeners();
  }
}