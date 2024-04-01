import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class CurveContainerView extends StatelessWidget {
   CurveContainerView({
     required this.text,
     required this.onTapOption,
     Key? key}) : super(key: key);

   String? text;
  Function(String? docName) onTapOption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapOption(text!);
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: outlineGreyBorder,
        child: Text(text!,
        style: whiteText14,
        ),
      ),
    );
  }
}
