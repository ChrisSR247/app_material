import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/counter_controls.dart';
import 'counter_detail.dart';
import '../../state/counter_provider.dart';

class CounterHomeB extends StatelessWidget {
  const CounterHomeB({super.key});

  @override
  Widget build(BuildContext context) {
    print("🏗️ [B] Rebuild de CounterHomeB");

    final provider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Contador – Variante B: Provider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Valor: ${provider.value}", style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          CounterControls(
            onIncrement: provider.increment,
            onDecrement: provider.decrement,
            onReset: provider.reset,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CounterDetailScreen(
                  counter: provider.value,
                  history: provider.history,
                ),
              ),
            ),
            child: const Text("Ver detalle"),
          ),
        ],
      ),
    );
  }
}
