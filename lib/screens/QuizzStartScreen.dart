import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/screens/HomeScreen.dart';
import 'package:test_app/widgets/CircularProgressIndicator.dart';
import 'package:test_app/widgets/RoundButton.dart';

class QuizzStartScreen extends StatelessWidget {
  QuizzStartScreen(
      {this.isQuizzCompleted = false,
      this.progressPercentage = 0.0,
      this.taskCompletePercentage = '0%',
      this.docFillPercentage = 0.0,
      Key? key})
      : super(key: key);

  bool isQuizzCompleted;
  double progressPercentage;
  double docFillPercentage;
  String taskCompletePercentage;
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            isQuizzCompleted ? '' : strUserProfile,
            style: whiteText14AppBar,
          )),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicatorWidget(
                  level: '',
                  percentage: progressPercentage,
                  progressValue: taskCompletePercentage,
                  progressTypeValue: '',
                  docFillPercentage: docFillPercentage,
                ),
                //const SizedBox(height: 30,),
                Text(
                  _getTitleText(),
                  style: whiteText20,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  _getInfoText(),
                  style: pinkText10,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            RoundButton(
              btnTextStyle: blackText14,
              bgColor: white,
              btnText: isQuizzCompleted ? strReStart : strStart,
              onTap: () {
                _navigateToHomeScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  String _getTitleText() {
    return isQuizzCompleted ? strCongratulations : strDocumentDetails;
  }

  String _getInfoText() {
    return isQuizzCompleted
        ? strQuizzCompleted.replaceFirst('__&&__', taskCompletePercentage)
        : strCreateUserProfile;
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
