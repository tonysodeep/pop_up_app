import 'package:shared_preferences/shared_preferences.dart';

class CounterSharePreferences {
  static const _OPENED_COUNTER = 'OPENED_COUNTER';
  static const _DATE_POP_UP = 'DATE_POP_UP';
  static const _DATE_OPEN_POP_UP = 'DATE_OPEN_POP_UP';
  static late SharedPreferences _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setCounter(int times) async =>
      _preferences.setInt(_OPENED_COUNTER, times);

  static Future<int> getCounter() async {
    final counter = _preferences.getInt(_OPENED_COUNTER);
    if (counter == null) {
      return 1;
    } else
      return counter;
  }

  static Future<void> setDatePopUp(String date) async =>
      _preferences.setString(_DATE_POP_UP, date);

  static Future<String?> getDatePopUp() async {
    final date = _preferences.getString(_DATE_POP_UP);
    if (date == null) {
      return null;
    }
    return date;
  }

  static Future<void> setDateOpenPopUp(int date) async =>
      _preferences.setInt(_DATE_OPEN_POP_UP, date);

  static Future<int?> getDateOpenPopUp() async {
    final date = _preferences.getInt(_DATE_OPEN_POP_UP);
    if (date == null) {
      return null;
    }
    return date;
  }
}
