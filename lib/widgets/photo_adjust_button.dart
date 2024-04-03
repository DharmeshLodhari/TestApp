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
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: btnColor,
          width: 1.5,
        ),
      ),
      child: Container(
        width: 16,
        height: 16,
        color: btnColor,
      ),
    );
  }
}
