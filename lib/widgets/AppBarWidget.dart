import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
class AppBarView extends StatelessWidget {
   AppBarView({
    this.onTapSkip,
    required this.title,
     this.showSkip = true,
    Key? key}) : super(key: key);

  Function()? onTapSkip;
  String? title;
  bool showSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        Text(title!,
          style: whiteText14AppBar,
        ),
        Expanded(child: Container()),
        if(showSkip)
        InkWell(
          onTap: onTapSkip,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(strSkip,
              style: greyText14,
            ),
          ),
        ),
      ],
    );
  }
}
