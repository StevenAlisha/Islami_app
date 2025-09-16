import 'package:flutter/material.dart';

import '../App_Styles.dart';
import '../appcolors.dart';
import '../appimages.dart';

class Mostrecently extends StatelessWidget {
  const Mostrecently({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Most Recently', style: AppStyles.bold16white),
        SizedBox(height: height * 0.02),
        SizedBox(
          height: height * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Al-Anbiya', style: AppStyles.bold24black),
                        Text('الانبياء', style: AppStyles.bold24black),
                        Text('112 Verses', style: AppStyles.bold14black),
                      ],
                    ),
                    Image(image: AssetImage(AppAssets.Sura_image)),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: width * 0.02);
            },
          ),
        ),
      ],
    );
  }
}
