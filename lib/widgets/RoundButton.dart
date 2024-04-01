import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.bgColor,
    required this.btnTextStyle,
    required this.btnText,
    required this.onTap,
    this.btnOpacity = 1.0,
    super.key,
  });
  final Color? bgColor;
  final TextStyle? btnTextStyle;
  final String? btnText;
  final Function()? onTap;
  final double? btnOpacity;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: btnOpacity!,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: onTap!,
              style: TextButton.styleFrom(
                backgroundColor: bgColor!,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                btnText ?? "",
                style: btnTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
