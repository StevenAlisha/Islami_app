import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/tabs/Quran/most_recently.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostrecently = [];

  void readMostRecentlyList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> mostrecentlyList = pref.getStringList(Shared.key) ?? [];
    mostrecently = mostrecentlyList
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
