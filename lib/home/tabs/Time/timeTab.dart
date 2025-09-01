import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/tabs/Time/timeWidget.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';

import '../Hadeth/hadeth_item.dart';

class Timetab extends StatelessWidget {
  const Timetab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.primarybgcolor,
                ),
                height: height * 0.3,
              ),
              Image(image: AssetImage(AppAssets.timecir)),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Timewidget(
                          text1: '16 JUL',
                          text2: '2025',
                          style1: AppStyles.bold16white,
                          style2: AppStyles.bold16white,
                        ),
                        Timewidget(
                          text1: 'Pray Time',
                          text2: 'Tseday',
                          style1: AppStyles.bold20blackbg,
                          style2: AppStyles.bold20black,
                        ),
                        Timewidget(
                          text1: '09 Muh',
                          text2: '1446',
                          style1: AppStyles.bold16white,
                          style2: AppStyles.bold16white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: height * 0.15,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.3,
                    ),
                    items: List.generate(50, (index) => index + 1).map((index) {
                      return Container(
                        width: height * 0.12,
                        decoration: BoxDecoration(
                          color: AppColors.blackbgColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('ASR', style: AppStyles.bold16white),
                            Text('04:12', style: AppStyles.bold20white),
                            Text('PM', style: AppStyles.bold16white),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: height * 0.01),
                  Padding(
                    padding: EdgeInsets.only(
                      left: height * 0.2,
                      right: height * 0.02,
                    ),
                    child: Row(
                      children: [
                        Text('Next Pray', style: AppStyles.bold16blackbg),
                        Text('-02:05', style: AppStyles.bold16black),
                        Spacer(),
                        Icon(Icons.ac_unit),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Azkar', style: AppStyles.bold16white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.blackColor,
                ),
                width: height * 0.20,
                child: Column(
                  children: [
                    Image(image: AssetImage(AppAssets.eveningazkar)),
                    Text('Evening Azkar', style: AppStyles.bold20white),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.blackColor,
                ),
                width: height * 0.22,
                child: Column(
                  children: [
                    Image(image: AssetImage(AppAssets.morningazkar)),
                    Text('Morning Azkar', style: AppStyles.bold20white),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
