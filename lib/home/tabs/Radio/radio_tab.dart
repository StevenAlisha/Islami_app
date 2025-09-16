import 'package:flutter/material.dart';

import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

List<String> Name = [
  'Radio Ibrahim Al-Akdar',
  'Radio Al-Qaria Yassen',
  'Radio Ahmed Al-trabulsi',
  'Radio Addokali Mohammad Alalim',
];
int selectedIndex = 0;
bool isFavorite = false;
final List<String> words = [" Radio", "Reciters"];

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(words.length, (index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: height * 0.05,
                    width: height * 0.2,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.transparentColor,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      words[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: height * 0.01),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.16,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Text(Name[index], style: AppStyles.bold24black),
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.07,
                                left: height * 0.06,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow_sharp, size: 30),
                                  SizedBox(width: 10),

                                  Icon(Icons.surround_sound, size: 30),
                                ],
                              ),
                            ),
                            Image.asset(AppAssets.mosque),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height * 0.01);
                },
                itemCount: Name.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
