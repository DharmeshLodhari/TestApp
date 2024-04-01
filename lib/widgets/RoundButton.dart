import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';
class RoundButton extends StatelessWidget {
   RoundButton({
     required this.bgColor,
     required this.btnTextStyle,
     required this.btnText,
     required this.onTap,
     this.btnOpacity = 1.0,
     Key? key}) : super(key: key);
   Color? bgColor;
   TextStyle? btnTextStyle;
   String? btnText;
   Function()?  onTap;
   double? btnOpacity;

  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: Alignment.bottomCenter,
      child:   Opacity(
        opacity: btnOpacity!,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed:onTap!,
              child: Text(btnText!,
                style: btnTextStyle,
              ),
              style: TextButton.styleFrom(
                backgroundColor: bgColor!,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
