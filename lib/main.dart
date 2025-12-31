import 'package:butceakintisi/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  // 1. Setup Flutter bindings
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Run App wrapped in ProviderScope
  // We do NOT open the database here. The provider handles it automatically.
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Database Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}
