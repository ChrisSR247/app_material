import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/counter/presentation/screens/counter_home_a.dart';
import 'features/counter/presentation/screens/counter_home_b.dart';
import 'features/counter/state/counter_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider()..load(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterHomeA(), // Cambiar a B para probar Provider
    );
  }
}
