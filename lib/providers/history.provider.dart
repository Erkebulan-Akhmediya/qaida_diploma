import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HistoryProvider extends ChangeNotifier {

  Future<List> getHistory() async {
    const storage = FlutterSecureStorage();
    final bool hasHistory = await storage.containsKey(key: 'history');
    if (!hasHistory) return [];

    final String? historyJson = await storage.read(key: 'history');
    return jsonDecode(historyJson!) as List;
  }

  Future<void> addHistory(Map place) async {
    const storage = FlutterSecureStorage();
    List history = await getHistory();

    history = [place, ...history];
    if (history.length > 5) history.removeLast();

    final String historyJson = jsonEncode(history);
    await storage.write(key: 'history', value: historyJson);

    notifyListeners();
  }

}