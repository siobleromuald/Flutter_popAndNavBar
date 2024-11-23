import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma_meteo/views/home_page.dart';

void main() {
  //Assurer l'initialisation
  WidgetsFlutterBinding.ensureInitialized();
  //On veut que le portrait comme orientation du mobile
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meteo',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const HomePage(),
    );
  }
}


