import 'package:flutter/material.dart';
import 'package:islami/home/tabs/Quran/quran_resources.dart';
import 'package:provider/provider.dart';

import '../../../provider/most_Recent_provider.dart';
import '../../../utls/App_Styles.dart';
import '../../../utls/appcolors.dart';
import '../../../utls/appimages.dart';
import 'most_recently.dart';

class MostrecentlyWidget extends StatefulWidget {
  MostrecentlyWidget({super.key});

  @override
  State<MostrecentlyWidget> createState() => _MostrecentlyWidgetState();
}

class _MostrecentlyWidgetState extends State<MostrecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.readMostRecentlyList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: mostRecentProvider.mostrecently.isNotEmpty,
      child: SizedBox(
        height: height * 0.16,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: mostRecentProvider.mostrecently.length,
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
                      Text(
                        QuranResourcesList.englishQuranSurahs[mostRecentProvider
                            .mostrecently[index]],
                        style: AppStyles.bold24black,
                      ),
                      Text(
                        QuranResourcesList.arabicAuranSuras[mostRecentProvider
                            .mostrecently[index]],
                        style: AppStyles.bold24black,
                      ),
                      Text(
                        QuranResourcesList.AyaNumber[mostRecentProvider
                            .mostrecently[index]],
                        style: AppStyles.bold14black,
                      ),
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
    );
  }
}
