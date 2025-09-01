import 'package:flutter/material.dart';
import 'package:islami/homepaqge.dart';
import 'package:islami/utls/approute.dart';

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
      initialRoute: AppRoute.homeRouteName,
      routes: {AppRoute.homeRouteName: (context) => Homepaqge()},
    );
  }
}
