import 'package:flutter/material.dart';

class CounterControls extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  const CounterControls({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(onPressed: onDecrement, child: const Text('-')),
        ElevatedButton(onPressed: onReset, child: const Text('Reset')),
        ElevatedButton(onPressed: onIncrement, child: const Text('+')),
      ],
    );
  }
}
