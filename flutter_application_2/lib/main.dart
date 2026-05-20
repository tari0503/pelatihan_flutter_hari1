import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorSchemeSeed: Colors.deepPurple,

        textTheme: GoogleFonts.poppinsTextTheme(),

        scaffoldBackgroundColor: Colors.white,
      ),

      home: const LandingPage(),
    );
  }
}