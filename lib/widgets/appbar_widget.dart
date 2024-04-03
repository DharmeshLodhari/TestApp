import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    this.onTapSkip,
    required this.title,
    this.useExpanded = true,
    this.showSkip = true,
    super.key,
  });

  final Function()? onTapSkip;
  final String? title;
  final bool showSkip;
  final bool useExpanded;

  @override
  Widget build(BuildContext context) {
    if (useExpanded == false) {
      return titleText();
    }

    return Row(
      children: [
        Expanded(child: Container()),
        Text(
          title ?? "",
          style: whiteText14AppBar,
        ),
        Expanded(child: Container()),

        _buildSkipButton()
      ],
    );
  }
  Widget _buildSkipButton(){
    if(showSkip){
      return InkWell(
        onTap: onTapSkip,
        child: Container(
          width: 50,
          height: 40,
          alignment: Alignment.center,
          child: showSkip
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              strSkip,
              style: greyText12,
            ),
          )
              : Container(),
        ),
      );
    }
    return const SizedBox(
      width: 50,
      height: 40,);
  }

  titleText() {
    return Text(
      title ?? "",
      style: whiteText14AppBar,
    );
  }
}
