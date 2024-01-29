import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  int _authPageIndex = 0;
  int get authPageIndex => _authPageIndex;

  changeAuthPage() {
    if (_authPageIndex == 0) {
      _authPageIndex = 1;
    } else {
      _authPageIndex = 0;
    }
    notifyListeners();
  }
}