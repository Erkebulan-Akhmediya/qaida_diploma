import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PlaceProvider extends ChangeNotifier {
  late String id;
  Map? place;

  void setId(String id) {
    this.id = id;
    notifyListeners();
  }

  Future<void> getPlaceById() async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/place/place/$id'),
      );
      place = Map.from(jsonDecode(response.body));
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
