import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/common/constants.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/common/utils.dart';
import 'package:test_app/models/UserProfileModel.dart';
import 'package:test_app/providers/UserQuizzDataProvider.dart';
import 'package:test_app/screens/ContactNumberScreen.dart';
import 'package:test_app/screens/CountryListScreen.dart';
import 'package:test_app/screens/PhotoPlanningScreen.dart';
import 'package:test_app/screens/QuizzStartScreen.dart';
import 'package:test_app/widgets/AppBarWidget.dart';
import 'package:test_app/widgets/CircularProgressIndicator.dart';
import 'package:test_app/widgets/CurveContainerVew.dart';
import 'package:test_app/widgets/DropDownWidget.dart';
import 'package:test_app/widgets/PrevAndNextButton.dart';
import 'package:test_app/widgets/RoundButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> docList = [
    strPassport,
    strNationalCard,
    strCancel.toUpperCase()
  ];

  UserProfileModel userProfileModel = UserProfileModel();

  double progressPercentage = 0.0;
  double docFillPercentage = 0.0;
  String taskCompletePercentage = '0%';

  int totalQuestions = 2;

  Widget _buildViewForLandscape(UserQuizzDataProvider provider){
    if(MediaQuery.of(context).orientation == Orientation.landscape){
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(

              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      strDocumentDetails,
                      style: whiteBoldText26,
                    ),
                  ),
                  const SizedBox(width: 10),

                  Spacer(),

                  Container(

                    child: CircularProgressIndicatorWidget(
                      level: '',
                      percentage: progressPercentage,
                      progressValue: taskCompletePercentage,
                      progressTypeValue: '',
                      docFillPercentage: docFillPercentage,
                      dotLegnth: 0.1,
                      dotPosition: Utils().getDotPosition(provider.questionIndex),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),

            _buildQuestionSeries(provider),
            _buildButtonForNextQsn(provider),
          ],
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(

          child: Row(
            children: [
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  strDocumentDetails,
                  style: whiteBoldText26,
                ),
              ),
              const SizedBox(width: 10),
              Container(

                child: CircularProgressIndicatorWidget(
                  level: '',
                  percentage: progressPercentage,
                  progressValue: taskCompletePercentage,
                  progressTypeValue: '',
                  docFillPercentage: docFillPercentage,
                  dotLegnth: 0.1,
                  dotPosition: Utils().getDotPosition(provider.questionIndex),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildQuestionSeries(provider),
        Expanded(child: Container()),
        _buildButtonForNextQsn(provider),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserQuizzDataProvider>(context);
    return ColorfulSafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            centerTitle: true,
            leading: InkWell(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 16,
              ),
              onTap: () {
                if(provider.questionIndex == 0){
                  provider.resetData();
                  Navigator.pop(context);
                }else{
                  provider.decreaseIndex();
                }

              },
            ),
            title: AppBarView(
              showSkip: provider.questionIndex == totalQuestions ? false : true,
              title: strInformation,
              onTapSkip: () {
                provider.increaseIndex();
              },
            )),
        body: Container(
          margin: const EdgeInsets.all(10),
          child:_buildViewForLandscape(provider),
        ),
      ),
    );
  }

  Widget _buildQuestionSeries(UserQuizzDataProvider provider) {
    if (provider.questionIndex == 0) {
      return DropDownView(
        selectedValue: provider.userProfileModel.selectedDoc!,
        showDocsOptions: () {
          showModalBottomSheet<void>(
              backgroundColor: black.withOpacity(0.95),
              barrierColor: black.withOpacity(0.95),
              context: context,
              elevation: 0,

              builder: (BuildContext context) {
                return Wrap(
                  children: [
                    Container(
                      color: black.withOpacity(0.95),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemBuilder: (context, index) {
                              bool isCancelAction = false;

                              if (docList[index].toLowerCase() ==
                                  strCancel.toLowerCase()) {
                                isCancelAction = true;
                              }

                              return CurveContainerView(
                                isCancelAction: isCancelAction,
                                text: docList[index],
                                onTapOption: (val) {
                                  if (val?.toLowerCase() ==
                                      strCancel.toLowerCase()) {
                                    Navigator.of(context).pop();
                                    return;
                                  }
                                  if (provider
                                      .userProfileModel.selectedDoc!.isEmpty) {
                                    progressPercentage = Utils()
                                        .calculatePercentage(
                                            progressPercentage);
                                    taskCompletePercentage = Utils()
                                        .convertPercentageToStr(
                                            progressPercentage);
                                    docFillPercentage = Utils()
                                        .calculatePercentageDocFill(
                                            docFillPercentage);
                                  }
                                  provider.setDoc(val!);
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                            itemCount: docList.length,
                            shrinkWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        },
      );
    }
    if (provider.questionIndex == 1) {
      return Column(
        children: [
          DropDownView(
            hintText: strNumber,
            showDropArrow: false,
            selectedValue: provider.userProfileModel.contactNumber!,
            showDocsOptions: () {
              _navigateToContactAddScreen(context, provider);
            },
          ),
          const SizedBox(height: 16),
          DropDownView(
            hintText: strCountry,
            selectedValue: provider.userProfileModel.selctedCountry == null
                ? ''
                : provider.userProfileModel.selctedCountry!.name,
            showDocsOptions: () {

              showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: black.withOpacity(0.95),
                  builder: (BuildContext context) {
                    return Material(
                      color: black.withOpacity(0.95),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                // height:
                                //     MediaQuery.of(context).size.height * 0.80,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  border: Border(
                                    bottom:
                                        BorderSide(color: Color(0xFF6E6E73)),
                                    right: BorderSide(color: Color(0xFF6E6E73)),
                                    left: BorderSide(color: Color(0xFF6E6E73)),
                                    top: BorderSide(color: Color(0xFF6E6E73)),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  top: 2,
                                  left: 10,
                                  right: 10,
                                ),
                                child: CountryListScreen(
                                  selectedCountry:
                                      provider.userProfileModel.selctedCountry,
                                  onCountrySelect: (country) {
                                    if (provider
                                            .userProfileModel.selctedCountry ==
                                        null) {
                                      progressPercentage =
                                          Utils().calculatePercentage(
                                        progressPercentage,
                                      );
                                      taskCompletePercentage =
                                          Utils().convertPercentageToStr(
                                        progressPercentage,
                                      );
                                      if (provider.userProfileModel
                                          .contactNumber!.isNotEmpty) {
                                        docFillPercentage =
                                            Utils().calculatePercentageDocFill(
                                          docFillPercentage,
                                        );
                                      }
                                    }
                                    provider.setCountry(country);
                                    //  provider.userProfileModel.selctedCountry = country;
                                    if (provider.userProfileModel.contactNumber!
                                        .isNotEmpty) {
                                      provider.setBtnOpacity(1.0);
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            CurveContainerView(
                                isCancelAction: true,
                                text: strCancel.toUpperCase(),
                                onTapOption: (val) {
                                  Navigator.of(context).pop();
                                }),

                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      );
    }

    if (provider.questionIndex == 2) {
      return DropDownView(
        hintText: strPhoto,
        icon: Icons.camera_alt,
        iconColor: provider.userProfileModel.imageFileName?.isEmpty ?? false
            ? grey
            : pink,
        selectedValue: provider.userProfileModel.imageFileName ?? "",
        showDocsOptions: () async {
          userProfileModel = await Utils().pickImage(userProfileModel);
          if (userProfileModel.imageFile != null) {
            _navigateToPhotoPlanningScreen(
                context, userProfileModel.imageFile!, provider);
          }
        },
      );
    }
    return Container();
  }

  void _navigateToPhotoPlanningScreen(BuildContext context, File imageFile,
      UserQuizzDataProvider provider) async {
    var result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PhotoPlanningScreen(
              userProfileModel: userProfileModel,
            )));
    if (result['ImageFileName'] != null) {
      progressPercentage = Utils().calculatePercentage(progressPercentage);
      taskCompletePercentage =
          Utils().convertPercentageToStr(progressPercentage);
      docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);
    }
    provider.setProfileImage(imageFile, result['ImageFileName'] as String);

    provider.setBtnOpacity(1.0);
  }

  Widget _buildButtonForNextQsn(UserQuizzDataProvider provider) {
    if (provider.questionIndex == 0) {
      return RoundButton(
        btnTextStyle: whiteText13Bold,
        bgColor: pink,
        btnText: 'NEXT',
        onTap: () {
          provider.increaseIndex();
          provider.setBtnOpacity(0.4);
        },
        btnOpacity: provider.userProfileModel.selectedDoc!.isEmpty ? 0.4 : 1.0,
      );
    }
    return PrevAndNextButtonView(
      btnText: totalQuestions == provider.questionIndex ? 'FINISH' : 'NEXT',
      btnOpacity: provider.nextBtnOpacity,
      onTapPrevBtn: () {
        provider.decreaseIndex();
      },
      onTapNextBtn: () {
        if (totalQuestions == provider.questionIndex && provider.nextBtnOpacity == 1.0) {
          _navigateToQuizzEndScreen(context, provider);
          return;
        }
        if (provider.nextBtnOpacity == 1.0) {
          provider.increaseIndex();
          provider.setBtnOpacity(0.4);

        }
      },
    );
  }

  void _navigateToContactAddScreen(
      BuildContext context, UserQuizzDataProvider provider) async {
    var result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>  ContactNumberScreen(
          contactNo: provider.userProfileModel.contactNumber!,
        )));
    if (result['Number'] != null) {
      if (provider.userProfileModel.contactNumber!.isEmpty) {
        progressPercentage = Utils().calculatePercentage(progressPercentage);
        taskCompletePercentage =
            Utils().convertPercentageToStr(progressPercentage);
        if (provider.userProfileModel.selctedCountry != null) {
          docFillPercentage =
              Utils().calculatePercentageDocFill(docFillPercentage);
        }
      }
      provider.setContactNumber(result['Number'] as String);

      if (provider.userProfileModel.selctedCountry != null) {

        provider.setBtnOpacity(1);
      }
    }
  }

  void _navigateToQuizzEndScreen(
      BuildContext context, UserQuizzDataProvider provider) async {
    provider.resetData();
    Navigator.of(context).popUntil((route) => false);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => QuizzStartScreen(
              isQuizzCompleted: true,
              progressPercentage: progressPercentage,
              taskCompletePercentage: taskCompletePercentage,
              docFillPercentage: docFillPercentage,
            )));
  }
}
