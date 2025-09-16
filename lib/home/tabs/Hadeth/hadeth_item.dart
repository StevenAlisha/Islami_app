import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/tabs/Hadeth/hadeeth_model.dart';
import 'package:islami/utls/App_Styles.dart';
import 'package:islami/utls/appcolors.dart';
import 'package:islami/utls/appimages.dart';

class HadeethItem extends StatefulWidget {
  HadeethItem({super.key, required this.index});

  int index;

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.hadethdetailsbg)),
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackbgColor),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: height * 0.01,
                left: height * 0.01,
                right: height * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.left, width: width * 0.16),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          hadeth?.titl ?? " ",
                          style: AppStyles.bold24black,
                        ),
                      ),
                      Image.asset(AppAssets.right, width: width * 0.16),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        hadeth?.conten ?? " ",
                        style: AppStyles.bold24black,
                      ),
                    ),
                  ),
                  Image(image: AssetImage(AppAssets.mosque)),
                ],
              ),
            ),
    );
  }

  void loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeth/h${widget.index}.txt',
    );
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(titl: title, conten: content);
    setState(() {});
  }
}
