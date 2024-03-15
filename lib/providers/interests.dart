import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class InterestsProvider extends ChangeNotifier {
  List interests = [];
  List<bool> openItems = [];
  List<bool> selectedItems = [];

  void changeOpen(int index) {
    openItems[index] = !openItems[index];
    notifyListeners();
  }

  void changeSelect(int index) {
    selectedItems[index] = !selectedItems[index];
    notifyListeners();
  }

  subcategories(int index) {
    return interests[index]['categories'];
  }

  Future<void> fetchInterests() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/api/categories?q=")
    );
    interests = jsonDecode(response.body);
    openItems = List<bool>.filled(interests.length, false);
    selectedItems = List<bool>.filled(interests.length, false);
    notifyListeners();
  }
}