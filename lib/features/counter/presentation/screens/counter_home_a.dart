import 'package:flutter/material.dart';
import '../../data/counter_persistence.dart';
import '../widgets/counter_controls.dart';
import 'counter_detail.dart';

class CounterHomeA extends StatefulWidget {
  const CounterHomeA({super.key});

  @override
  State<CounterHomeA> createState() => _CounterHomeAState();
}

class _CounterHomeAState extends State<CounterHomeA> {
  int counter = 0;
  final history = <String>[];
  final persistence = CounterPersistence();

  @override
  void initState() {
    super.initState();
    persistence.load().then((value) {
      setState(() => counter = value);
    });
  }

  void _addHistory(String action) {
    final timestamp = DateTime.now().toIso8601String();
    history.add('$action → $counter en $timestamp');
  }

  void _increment() {
    setState(() {
      counter++;
      _addHistory("Incremento");
    });
    persistence.save(counter);
  }

  void _decrement() {
    setState(() {
      counter--;
      _addHistory("Decremento");
    });
    persistence.save(counter);
  }

  void _reset() {
    setState(() {
      counter = 0;
      _addHistory("Reset");
    });
    persistence.save(counter);
  }

  @override
  Widget build(BuildContext context) {
    print("🏗️ [A] Rebuild de CounterHomeA");

    return Scaffold(
      appBar: AppBar(title: const Text("Contador – Variante A: setState")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Valor: $counter", style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          CounterControls(
            onIncrement: _increment,
            onDecrement: _decrement,
            onReset: _reset,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CounterDetailScreen(
                  counter: counter,
                  history: history,
                ),
              ),
            ),
            child: const Text("Ver detalle"),
          )
        ],
      ),
    );
  }
}
