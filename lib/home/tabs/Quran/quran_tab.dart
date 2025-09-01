import 'package:flutter/material.dart';
import 'package:islami/home/tabs/Quran/mostREcently_widget.dart';
import 'package:islami/home/tabs/Quran/most_recently.dart';
import 'package:islami/home/tabs/Quran/quran_resources.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';
import 'package:islami/utls/approute.dart';
import 'package:islami/utls/widgets/mostRecently.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newtext) {
              searchbyNewtext(newtext);
            },
            style: AppStyles.bold20white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: builtOutLineBorder(),
              focusedBorder: builtOutLineBorder(),
              hintStyle: AppStyles.bold16white,
              prefixIcon: Image.asset(AppAssets.quransearsh),
              hintText: 'Sura Name',
            ),
          ),
          SizedBox(height: height * 0.02),
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          MostrecentlyWidget(),
          SizedBox(height: height * 0.02),
          Text("Suras List", style: AppStyles.bold16white),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo Save Last Sura Index
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                      AppRoute.suradetailes,
                      arguments: filterList[index],
                    );
                  },
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(image: AssetImage(AppAssets.vector)),
                          Text('${index + 1}', style: AppStyles.bold20white),
                        ],
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResourcesList
                                .englishQuranSurahs[filterList[index]],
                            style: AppStyles.bold20white,
                          ),
                          SizedBox(width: width * 0.03),
                          Text(
                            QuranResourcesList.AyaNumber[filterList[index]],
                            style: AppStyles.bold16white,
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        QuranResourcesList.arabicAuranSuras[filterList[index]],
                        style: AppStyles.bold20white,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  endIndent: width * 0.10,
                  indent: width * 0.10,
                  color: AppColors.WhiteColor,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtOutLineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),

      borderRadius: BorderRadius.circular(16),
    );
  }

  void searchbyNewtext(String newtext) {
    List<int> SearchResultList = [];
    for (int i = 0; i < QuranResourcesList.englishQuranSurahs.length; i++) {
      if (QuranResourcesList.englishQuranSurahs[i].toLowerCase().contains(
        newtext.toLowerCase(),
      )) {
        SearchResultList.add(i);
      }
      if (QuranResourcesList.arabicAuranSuras[i].contains(newtext)) {
        SearchResultList.add(i);
      }
    }
    filterList = SearchResultList;
    setState(() {});
  }
}
