import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationProvider extends ChangeNotifier {
  List places = [];

  Future<void> getRecommendedPlaces(String userId) async {
    try {
      print('request is sent');

      http.Response response = await http.post(
        Uri.parse('http://10.0.2.2:8001/recommend'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({ 'user_id': userId }),
      );
      places = List.from(jsonDecode(response.body));
      notifyListeners();

      print('response: $places');
    } catch(e) {
      print(e);
    }
  }
}
