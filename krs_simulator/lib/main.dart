import 'package:flutter/material.dart';
import 'package:krs_simulator/providers/krs_providers.dart';
import 'package:krs_simulator/views/krs_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    // Menginjeksikan Provider ke puncak hierarki pohon widget (Widget Tree)
    ChangeNotifierProvider(
      create: (_) => KrsProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Akademik Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const KrsPage(),
    );
  }
}
