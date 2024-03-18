import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  Future getMe() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');

    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/user/me'),
      headers: {
        'Authorization': 'Bearer $token',
      }
    );
    return jsonDecode(response.body);
  }
}