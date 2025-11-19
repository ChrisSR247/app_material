import 'package:flutter/material.dart';

class CounterDetailScreen extends StatelessWidget {
  final int counter;
  final List<String> history;

  const CounterDetailScreen({
    super.key,
    required this.counter,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle del contador")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Valor actual: $counter", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          const Text("Historial:", style: TextStyle(fontSize: 18)),
          Expanded(
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(history[i]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
