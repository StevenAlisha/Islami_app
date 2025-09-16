import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/tabs/Quran/quran_resources.dart';
import 'package:islami/provider/most_Recent_provider.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late MostRecentProvider mostRecentProvider;
  String verses = '';

  void dispose() {
    super.dispose();
    mostRecentProvider.readMostRecentlyList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);

    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackbgColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        centerTitle: true,
        title: Text(
          QuranResourcesList.englishQuranSurahs[index],
          style: AppStyles.bold20primary,
        ),
        actions: [
          GestureDetector(onTap: () {}, child: Icon(Icons.add)),
          SizedBox(width: width * 0.05),
          Icon(Icons.add_box),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.left_image),
                  Text(
                    QuranResourcesList.arabicAuranSuras[index],
                    style: AppStyles.bold20white,
                  ),
                  Image.asset(AppAssets.right_image),
                ],
              ),
              Image.asset(AppAssets.bottom_image),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.12),
            child: Container(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Text(
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          verses,
                          style: AppStyles.bold20primary,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemCount: 1,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/suras/${index + 1}.txt',
    );
    List<String> suraContent = fileContent.split('\n');
    for (int i = 0; i < suraContent.length - 2; i++) {
      suraContent[i] += '[${i + 1}]';
    }
    verses = suraContent.join();
    setState(() {});
  }
}

// Container(
// decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAssets.sura_details),fit: BoxFit.fill,)),
// child: Scaffold(
// appBar: AppBar(
// backgroundColor: AppColors.blackbgColor,
// iconTheme: IconThemeData(color: AppColors.primaryColor),
// centerTitle: true,
// title: Text(
// QuranResourcesList.englishQuranSurahs[index],style: AppStyles.bold20primary,),),
