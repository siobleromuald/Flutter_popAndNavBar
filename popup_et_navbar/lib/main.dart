import 'package:flutter/material.dart';
import 'package:popup_et_navbar/pages/bottomappbar.dart';
import 'package:popup_et_navbar/pages/bottomnavbar.dart';
import 'package:popup_et_navbar/pages/drawer_page.dart';
import 'package:popup_et_navbar/widgets/first_page.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PopUp et nav',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade400),
        useMaterial3: true,
      ),
      home: const BottomNavBarPage(title: 'Apprendre BottomApp Bar'),
    );
  }
}

