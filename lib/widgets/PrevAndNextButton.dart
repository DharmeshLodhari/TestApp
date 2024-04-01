import 'package:flutter/material.dart';
import 'package:test_app/common/styles.dart';
class PrevAndNextButtonView extends StatelessWidget {
   PrevAndNextButtonView({
     this.onTapNextBtn,
     this.onTapPrevBtn,
     this.btnOpacity = 1.0,
     this.btnText = 'NEXT',
     Key? key}) : super(key: key);

  double? btnOpacity;
  Function()? onTapPrevBtn;
  Function()? onTapNextBtn;

  String? btnText;


  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      _buildPrevButtonView(),
      _buildNextButtonView(),
    ],
    );
  }
  Widget _buildPrevButtonView(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 50,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8),
          child: TextButton(
            onPressed:onTapPrevBtn,
            child: Text('PREV',
              style: whiteText14,
            ),
            style: TextButton.styleFrom(
              backgroundColor: grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildNextButtonView(){
    return Expanded(
      child: Opacity(
        opacity: btnOpacity!,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              onPressed:onTapNextBtn,
              child: Text(btnText!,
                style: whiteText14,
              ),
              style: TextButton.styleFrom(
                backgroundColor: pink,
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
