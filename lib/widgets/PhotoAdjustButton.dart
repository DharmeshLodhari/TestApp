import 'package:flutter/material.dart';

class PhotoAdjustButton extends StatelessWidget {
  const PhotoAdjustButton({
    this.btnColor = const Color(0xFF6E6E73),
    super.key,
  });

  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: btnColor,
          width: 2.0,
        ),
      ),
      child: Container(
        width: 25,
        height: 25,
        color: btnColor,
      ),
    );
  }
}
