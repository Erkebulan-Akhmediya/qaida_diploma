import 'package:flutter/foundation.dart';

class TemplateProvider extends ChangeNotifier {
  int _templatePageIndex = 3;
  int get templatePageIndex => _templatePageIndex;

  final List<String> _templatePageTitles = [
    'Главная',
    'Категории',
    'Контакты',
    'Профиль',
  ];
  String get getTemplatePageTitle => _templatePageTitles[_templatePageIndex];

  changeTemplatePage(int index) {
    _templatePageIndex = index;
    notifyListeners();
  }
}