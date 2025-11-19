import 'package:shared_preferences/shared_preferences.dart';

class CounterPersistence {
  static const _key = 'counter_value';

  Future<int> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }

  Future<void> save(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, value);
  }
}
