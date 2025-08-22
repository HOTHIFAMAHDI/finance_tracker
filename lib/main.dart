import 'package:finance_tracker/widgets/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PersonalFinanceApp());
}

class PersonalFinanceApp extends StatelessWidget {
  const PersonalFinanceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Tracker',
      theme: ThemeData(
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 48, 153, 205),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
