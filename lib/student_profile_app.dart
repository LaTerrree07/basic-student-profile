import 'package:flutter/material.dart';

import 'student_profile_page.dart';

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF142D4E);
    return MaterialApp(
      title: 'Student Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          primary: navy,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: false,
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: navy,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
          titleMedium: TextStyle(color: navy, fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(color: Color(0xFF405169), height: 1.5),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFE0E6EE)),
          ),
        ),
      ),
      home: const StudentProfilePage(),
    );
  }
}
