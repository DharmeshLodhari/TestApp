import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/models/UserProfileModel.dart';
import 'package:test_app/screens/HomeScreen.dart';
import 'package:test_app/widgets/CircularProgressIndicator.dart';
import 'package:test_app/widgets/RoundButton.dart';


class QuizzStartScreen extends StatefulWidget {
  QuizzStartScreen({
  this.isQuizzCompleted = false,
  this.progressPercentage = 0.0,
  this.taskCompletePercentage = '0%',
  this.docFillPercentage = 0.0,
  required this.model,
  this.questionIndex = 0,
  super.key,
});
bool isQuizzCompleted;
double progressPercentage;
double docFillPercentage;
String taskCompletePercentage;
   UserProfileModel model;
 int questionIndex;
  @override
  _QuizzStartScreenState createState() => _QuizzStartScreenState();
}

class _QuizzStartScreenState extends State<QuizzStartScreen> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                widget.isQuizzCompleted ? '' : strUserProfile,
                style: whiteText14AppBar,
              )),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              physics: MediaQuery.of(context).orientation == Orientation.landscape ? null: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(


                    child: CircularProgressIndicatorWidget(
                      questionIndex: widget.questionIndex,
                      model: widget.model,
                      level: '',
                      percentage: widget.progressPercentage,
                      progressValue: widget.taskCompletePercentage,
                      progressTypeValue: '',
                      docFillPercentage: widget.docFillPercentage,
                      dotLegnth: 0.0,
                      dotPosition: 0.0,
                    ),

                  ),
                  const SizedBox(height: 28,),
                  Text(
                    _getTitleText(),
                    style: whiteText20,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    _getInfoText(),
                    style: pinkText13,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            RoundButton(
              btnTextStyle: blackText14,
              bgColor: white,
              btnText: widget.isQuizzCompleted ? strReStart : strStart,
              onTap: () {
                _reSetValue();

                _navigateToHomeScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }

  String _getTitleText() {
    return widget.isQuizzCompleted ? strCongratulations : strDocumentDetails;
  }

  String _getInfoText() {
    return widget.isQuizzCompleted
        ? strQuizzCompleted.replaceFirst('__&&__', widget.taskCompletePercentage)
        : strCreateUserProfile;
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _reSetValue(){
    widget.isQuizzCompleted = false;
    widget.progressPercentage = 0.0;
    widget.taskCompletePercentage = '0%';
    widget.docFillPercentage = 0.0;
    widget.questionIndex = 0;
    widget.model = UserProfileModel();
    setState(() {});

  }
}
