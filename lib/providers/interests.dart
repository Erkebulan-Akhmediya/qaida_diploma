import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class InterestsProvider extends ChangeNotifier {
  Future<List> fetchInterests() async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/api/categories?q=Кат")
    );
    return jsonDecode(response.body);
  }
}