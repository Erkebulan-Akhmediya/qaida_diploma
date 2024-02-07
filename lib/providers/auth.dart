import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  int _authPageIndex = 0;
  int get authPageIndex => _authPageIndex;

  bool _isAuthorized = false;
  bool get isAuthorized => _isAuthorized;

  String _authPageTitle = 'Войти';
  String get authPageTitle => _authPageTitle;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

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
}