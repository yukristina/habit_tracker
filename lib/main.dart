import 'package:flutter/material.dart';
import 'package:habittracker/pages/home_page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('Habit_Database');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}
