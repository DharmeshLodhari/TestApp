import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class PrevAndNextButtonView extends StatelessWidget {
  const PrevAndNextButtonView({
    this.onTapNextBtn,
    this.onTapPrevBtn,
    this.btnOpacity = 1.0,
    this.btnText = 'NEXT',
    super.key,
  });

  final double? btnOpacity;
  final Function()? onTapPrevBtn;
  final Function()? onTapNextBtn;

  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPrevButtonView(),
        _buildNextButtonView(),
      ],
    );
  }

  Widget _buildPrevButtonView() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextButton(
            onPressed: onTapPrevBtn,
            style: TextButton.styleFrom(
              backgroundColor: grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'PREV',
              style: whiteText14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButtonView() {
    return Expanded(
      child: Opacity(
        opacity: btnOpacity!,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed: onTapNextBtn,
              style: TextButton.styleFrom(
                backgroundColor: pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                btnText ?? "",
                style: whiteText14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
