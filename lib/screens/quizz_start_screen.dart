import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/models/user_profile_model.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/widgets/circular_progress_indicator.dart';
import 'package:test_app/widgets/round_button.dart';


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
  QuizzStartScreenState createState() => QuizzStartScreenState();
}

class QuizzStartScreenState extends State<QuizzStartScreen> {
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
              physics: MediaQuery.of(context).orientation == Orientation.landscape ? null:  const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicatorWidget(
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
