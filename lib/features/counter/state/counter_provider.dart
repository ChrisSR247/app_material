// archivo counter_provider.dart
import 'package:flutter/material.dart';
import '../data/counter_persistence.dart';

class CounterProvider extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  final history = <String>[];
  final persistence = CounterPersistence();

  Future<void> load() async {
    _value = await persistence.load();
    notifyListeners();
  }

  void _addHistory(String action) {
    final t = DateTime.now().toIso8601String();
    history.add('$action → $_value en $t');
  }

  void increment() {
    _value++;
    _addHistory("Incremento");
    persistence.save(_value);
    notifyListeners();
  }

  void decrement() {
    _value--;
    _addHistory("Decremento");
    persistence.save(_value);
    notifyListeners();
  }

  void reset() {
    _value = 0;
    _addHistory("Reset");
    persistence.save(_value);
    notifyListeners();
  }
}
