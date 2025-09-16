import 'package:flutter/material.dart';
import 'package:islami/home/tabs/Hadeth/hadeth_tab.dart';
import 'package:islami/home/tabs/Quran/quran_tab.dart';
import 'package:islami/home/tabs/Radio/radio_tab.dart';
import 'package:islami/home/tabs/Sebha/sebha_tab.dart';
import 'package:islami/home/tabs/Time/timeTab.dart';
import 'package:islami/utls/appcolors.dart';

import 'package:islami/utls/appimages.dart';


List<String>imagesList = [
  AppAssets.quranbg,
  AppAssets.hadethbg,
  AppAssets.sebhabg,
  AppAssets.radiobg,
  AppAssets.timebg,

];

List<Widget> tabs = [
  QuranTab(),
  HadethTab(),
  SebhaTab(),
  RadioTab(),
  Timetab(),

];

class Homepaqge extends StatefulWidget {
  Homepaqge({super.key});


  @override
  State<Homepaqge> createState() => _HomepaqgeState();
}

class _HomepaqgeState extends State<Homepaqge> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Stack(
      children: [
        Image.asset(
          imagesList[selectedindex],
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: Image.asset(
                      height: height * 0.15,
                      width: width * 0.96,
                      AppAssets.logo)

              ),


              Expanded(child: tabs[selectedindex]),
            ],),

          bottomNavigationBar: Theme(

            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedindex,
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(icon: buildButtonNavigationTab(
                    index: 0, iconName: AppAssets.iconQuran), label: 'Quran'),
                BottomNavigationBarItem(icon: buildButtonNavigationTab(
                    index: 1, iconName: AppAssets.iconHadeth), label: 'Hadeth'),
                BottomNavigationBarItem(icon: buildButtonNavigationTab(
                    index: 2, iconName: AppAssets.iconSebha), label: 'Sebha'),
                BottomNavigationBarItem(icon: buildButtonNavigationTab(
                    index: 3, iconName: AppAssets.iconRadio), label: 'Radio'),
                BottomNavigationBarItem(icon: buildButtonNavigationTab(
                    index: 4, iconName: AppAssets.iconTime), label: 'Time'),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildButtonNavigationTab(
      {required int index, required String iconName}) {
    return
      selectedindex == index ?
      Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
              color: AppColors.blackbgColor,
              borderRadius: BorderRadius.circular(66)
          ),
          child:
          ImageIcon(AssetImage(iconName))) :
      ImageIcon(AssetImage(iconName));
  }
}

