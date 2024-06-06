import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:qaida/data/user.data.dart';

class UserProvider extends ChangeNotifier {
  late User myself;
  int visitedCount = 0;
  int reviewCount = 0;
  List visitedPlaces = [];

  Future<void> getMe() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');

    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/user/me'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    myself = User.fromMap(jsonDecode(response.body));
  }

  Future<void> fetchVisitedCount() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');

    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/place/visited'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    List visited = List.from(jsonDecode(response.body));
    visitedPlaces = visited.map((visit) {
      final place = visit['place_id'];
      place['visited_id'] = visit['_id'];
      return place;
    }).toList();
    visitedCount = visited.length;
    reviewCount =
        visited.map((visit) => visit['status'] == 'VISITED').toList().length;
  }
}
