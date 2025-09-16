import 'package:flutter/material.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appimages.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.0;

  void _onTap() {
    setState(() {
      counter++;
      if (counter == 34) {
        counter = 1;
        index++;
        if (index == pray.length) {
          index = 0;
        }
      }

      turns += 1 / 33;
    });
  }

  int index = 0;

  List<String> pray = ['سبحان الله ', "الحمدلله", "سبحان الله"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
              style: AppStyles.bold36white,
            ),
            SizedBox(height: height * 0.03),

            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 300), // سرعة الحركة
                  child: GestureDetector(
                    onTap: _onTap,
                    child: Image.asset(AppAssets.sebha_body),
                  ),
                ),
                Column(
                  spacing: 3,
                  children: [
                    Text(pray[index], style: AppStyles.bold36white),
                    GestureDetector(
                      onTap: _onTap,
                      child: Text('$counter', style: AppStyles.bold36white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
