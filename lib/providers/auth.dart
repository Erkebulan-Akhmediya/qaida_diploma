import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  int _authPageIndex = 0;
  int get authPageIndex => _authPageIndex;

  bool _isAuthorized = false;
  bool get isAuthorized => _isAuthorized;

  changeAuthPage() {
    _authPageIndex = _authPageIndex == 0 ? 1 : 0;
    notifyListeners();
  }

  changeAuthStatus() {
    _isAuthorized = _isAuthorized == false ? true : false;
    notifyListeners();
  }
}