import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _prefs;

  static const String titlesKey = "saved_titles";
  static const String descriptionsKey = "saved_descriptions";
  static const String seenPermissionKey = "seen_permission_dialog";
  static const String currentLocal = 'current_local';
  static const String isRegisterd = 'is_Registerd';
  static const String userName = 'user_name';
  static const String darkMode = 'dark_mode';
  static const String heatMapData = 'heat_Map_Data';
  static const String habitChecked = 'habit_Checked';

  static Future<void> initSharedPreference() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static bool hasSeenPermissionDialog() {
    return _prefs?.getBool(seenPermissionKey) ?? false;
  }


  static Future<void> setSeenPermissionDialog(bool value) async {
    await _prefs?.setBool(seenPermissionKey, value);
  }


  static Future<void> saveSunnah(String title, String description) async {
    List<String> titles = _prefs!.getStringList(titlesKey) ?? [];
    List<String> descriptions = _prefs!.getStringList(descriptionsKey) ?? [];

    titles.add(title);
    descriptions.add(description);

    await _prefs!.setStringList(titlesKey, titles);
    await _prefs!.setStringList(descriptionsKey, descriptions);
  }


  static List<String> getTitles() {
    return _prefs!.getStringList(titlesKey) ?? [];
  }

  static List<String> getDescriptions() {
    return _prefs!.getStringList(descriptionsKey) ?? [];
  }


  static Future<void> removeSunnah(int index) async {
    List<String> titles = _prefs!.getStringList(titlesKey) ?? [];
    List<String> descriptions = _prefs!.getStringList(descriptionsKey) ?? [];

    titles.removeAt(index);
    descriptions.removeAt(index);

    await _prefs!.setStringList(titlesKey, titles);
    await _prefs!.setStringList(descriptionsKey, descriptions);
  }


  static Future<void> setLocal(String local) async {
    await _prefs!.setString(currentLocal, local);
  }

  static String? getLocal() {
    return _prefs!.getString(currentLocal);
  }

  static Future<void> setBoolForFirst(bool value) async {
    await _prefs!.setBool(isRegisterd, value);
  }

  static bool? getBoolForFirst() {
    return _prefs!.getBool(isRegisterd);
  }

  static Future<void> setUserName(String value) async {
    await _prefs!.setString(userName, value);
  }

  static String? getUseName() {
    return _prefs!.getString(userName);
  }

  static Future<void> setDarkMode(bool value) async {
    await _prefs!.setBool(darkMode, value);
  }

  static bool? getDarkMode() {
    return _prefs!.getBool(darkMode);
  }

  static Future<void> saveHeatmapData(Map<DateTime, int> dataset) async {
    final jsonString = _prefs!.getString(heatMapData);
    Map<String, int> existingData = {};

    if (jsonString != null && jsonString.isNotEmpty) {
      final Map<String, dynamic> decoded = jsonDecode(jsonString);
      existingData = decoded.map((key, value) => MapEntry(key, value as int));
    }

    dataset.forEach((key, value) {
      existingData[key.toIso8601String()] = value;
    });
    final updatedJsonString = jsonEncode(existingData);
    await _prefs!.setString(heatMapData, updatedJsonString);
  }

  static Future<Map<DateTime, int>> loadHeatMapData() async {
    final jsonString = _prefs!.getString(heatMapData);
    if (jsonString == null) return {};

    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return decoded.map(
      (key, value) => MapEntry(DateTime.parse(key), value as int),
    );
  }

  static Future<void> deleteHeatmapData() async {
    await _prefs!.remove(heatMapData);
  }

static bool isEnabled(int index){
final jsonString = _prefs!.getString(habitChecked);
if(jsonString == null) return true;
Map<String, dynamic> checkedMap = jsonDecode(jsonString);
String today = DateTime.now().toIso8601String().split('T')[0];

if (checkedMap.containsKey(index.toString())) {
  return checkedMap[index.toString()] != today;
}
return true;
}

static Future<void> markHabitClicked(int index) async {
  final jsonString = _prefs!.getString(habitChecked) ?? '{}';
  Map<String, dynamic> checkedMap = jsonDecode(jsonString);
  
  String today = DateTime.now().toIso8601String().split('T')[0];
  checkedMap[index.toString()] = today;

  await _prefs!.setString(habitChecked, jsonEncode(checkedMap));
}


}
