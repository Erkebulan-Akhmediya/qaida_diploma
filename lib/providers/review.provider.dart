import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ReviewProvider extends ChangeNotifier {
  List processing = [];

  Future getProcessingPlaces() async {
    String? token =
        await const FlutterSecureStorage().read(key: 'access_token');

    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/place/visited'),
      headers: {'Authorization': 'Bearer $token'},
    );

    List visited = List.from(jsonDecode(response.body));
    List processing = List.from(
      visited.where((data) => data['status'] == 'PROCESSING'),
    );
    this.processing = processing.map((data) => data['place_id']).toList();
    notifyListeners();
  }

  Future sendRating(String placeId, int rating) async {
    print(placeId);
    try {
      String? token =
          await const FlutterSecureStorage().read(key: 'access_token');

      await http.post(
        Uri.parse('http://10.0.2.2:8080/api/review'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'place_id': placeId,
          'comment': '',
          'score': rating,
        }),
      );

      http.Response response = await http.put(
        Uri.parse('http://10.0.2.2:8080/api/place/visited/$placeId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'status': 'VISITED',
        }),
      );

      processing.removeWhere((place) => place['_id'] == placeId);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
