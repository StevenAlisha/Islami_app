import 'package:flutter/material.dart';
import 'package:islami/home/tabs/Quran/sura_details.dart';
import 'package:islami/homepaqge.dart';
import 'package:islami/provider/most_Recent_provider.dart';
import 'package:islami/utls/approute.dart';
import 'package:islami/utls/appthem.dart';
import 'package:islami/utls/introductionScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.introscreen,
      routes: {
        AppRoute.introscreen: (context) => OnboardingScreen(),

        AppRoute.homeRouteName: (context) => Homepaqge(),

        AppRoute.suradetailes: (context) => SuraDetails(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
