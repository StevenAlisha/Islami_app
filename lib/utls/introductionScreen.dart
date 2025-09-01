import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';
import 'package:islami/utls/approute.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return IntroductionScreen(
      back: Text('Back', style: AppStyles.bold20primary),

      backSemantic: 'back',
      next: Text('Next', style: AppStyles.bold20primary),
      showBackButton: true,
      showFirstBackButton: true,
      skip: Text('data', style: AppStyles.bold20primary),
      done: Text('Finish', style: AppStyles.bold20primary),
      onDone: () {
        Navigator.pushNamed(context, AppRoute.homeRouteName);
      },
      onSkip: () {},

      pages: [
        PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: AppStyles.bold20primary,
            titlePadding: EdgeInsets.only(top: 150),
            imageAlignment: Alignment.center,
            titleTextStyle: AppStyles.bold20primary,
          ),
          body: 'Welcome To Islmi App',
          backgroundImage: AppAssets.introbg,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: Image.asset(AppAssets.intro_1),
          ),
          title: '',
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: AppStyles.bold16primary,
            titlePadding: EdgeInsets.only(top: height * 0.22),
            bodyPadding: EdgeInsets.only(top: height * 0.02),
            imageAlignment: Alignment.center,
            titleTextStyle: AppStyles.bold20primary,
          ),
          body: 'We Are Very Excited To Have You In Our Community ',
          backgroundImage: AppAssets.introbg,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: Image.asset(AppAssets.intro_2),
          ),
          title: ' Welcome To Islami',
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: AppStyles.bold16primary,
            titlePadding: EdgeInsets.only(top: height * 0.23),
            bodyPadding: EdgeInsets.only(top: height * 0.02),
            imageAlignment: Alignment.center,
            titleTextStyle: AppStyles.bold20primary,
          ),
          body: 'Read, and your Lord is the Most Generous',
          backgroundImage: AppAssets.introbg,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: Image.asset(AppAssets.intro_3),
          ),
          title: 'Reading the Quran',
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: AppStyles.bold16primary,
            titlePadding: EdgeInsets.only(top: height * 0.25),
            bodyPadding: EdgeInsets.only(top: height * 0.02),
            imageAlignment: Alignment.center,
            titleTextStyle: AppStyles.bold20primary,
          ),
          body: 'Praise the name of your Lord, the Most High',
          backgroundImage: AppAssets.introbg,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: Image.asset(AppAssets.intro_4),
          ),
          title: 'Bearish',
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyTextStyle: AppStyles.bold16primary,
            titlePadding: EdgeInsets.only(top: height * 0.25),
            bodyPadding: EdgeInsets.only(top: height * 0.02),
            imageAlignment: Alignment.center,
            titleTextStyle: AppStyles.bold20primary,
          ),
          body:
              'You can listen to the Holy Quran Radio through the application for free and easily',
          backgroundImage: AppAssets.introbg,
          image: Padding(
            padding: EdgeInsets.only(top: height * 0.2),
            child: Image.asset(AppAssets.intro_5),
          ),
          title: 'Holy Quran Radio',
        ),
      ],
    );
  }
}
