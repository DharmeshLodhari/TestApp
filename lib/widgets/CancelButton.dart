import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: black,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}
