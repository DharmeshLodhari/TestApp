import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class CurveContainerView extends StatelessWidget {
  const CurveContainerView(
      {required this.text,
      required this.onTapOption,
      this.isCancelAction = false,
      super.key});

  final String? text;
  final Function(String? docName) onTapOption;
  final bool isCancelAction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapOption(text!);
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: outlineGreyBorder(color: isCancelAction ? black : null),
        child: Text(
          text!,
          style: isCancelAction ? greyText14Bold : whiteText14,
        ),
      ),
    );
  }
}
