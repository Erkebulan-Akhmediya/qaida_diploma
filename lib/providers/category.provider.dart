import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List categories = [];

  Future<void> getCategories() async {
    http.Response response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/categories?q='),
    );
    categories = List.from(jsonDecode(response.body));
  }

  Future<List> getPlacesByCategories(String categoryId) async {
    http.Response response = await http.get(
      Uri.parse(
        'http://10.0.2.2:8080/api/place/search-category?rubric_id=$categoryId',
      ),
    );
    return List.from(jsonDecode(response.body));
  }
}
