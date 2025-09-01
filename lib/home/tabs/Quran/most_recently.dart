import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static String key = 'most_recrntly';
}

void saveLastSuraIndex(int newSurIndex) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> mostrecentlyList = pref.getStringList(Shared.key) ?? [];
  if (mostrecentlyList.contains('$newSurIndex')) {
    mostrecentlyList.remove('$newSurIndex');
    mostrecentlyList.insert(0, '$newSurIndex');
  } else {
    mostrecentlyList.insert(0, '$newSurIndex');
  }
  if (mostrecentlyList.length > 5) {
    mostrecentlyList = mostrecentlyList.sublist(0, 5);
  }

  pref.setStringList(Shared.key, ['$newSurIndex']);
  await pref.setStringList(Shared.key, mostrecentlyList);
}

Future<List<int>> readMostRecentlyList() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> mostrecentlyList = pref.getStringList(Shared.key) ?? [];
  List<int> mostrecentlyListasint = mostrecentlyList
      .map((element) => int.parse(element))
      .toList();
  return mostrecentlyListasint;
}
