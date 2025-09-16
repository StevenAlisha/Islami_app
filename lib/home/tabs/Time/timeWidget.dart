import 'package:flutter/cupertino.dart';
import 'package:islami/utls/App_Styles.dart';

class Timewidget extends StatelessWidget {
  Timewidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.style1,
    required this.style2,
  });

  String text1;
  String text2;
  TextStyle style1;
  TextStyle style2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text1, style: style1),
        Text(text2, style: style2),
      ],
    );
  }
}
