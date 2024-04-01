import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: black,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
