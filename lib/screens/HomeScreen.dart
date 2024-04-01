import 'dart:io';

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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> docList = ['Passport','National Card'];

  UserProfileModel userProfileModel = UserProfileModel();

  double progressPercentage = 0.0;
  double docFillPercentage = 0.0;
  String taskCompletePercentage = '0%';

  int totalQuestions = 2;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserQuizzDataProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading:  GestureDetector(
          child: Icon( Icons.arrow_back_ios, color: Colors.white,size: 16,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ),
        title: AppBarView(
          showSkip: provider.QuestiionIndex == totalQuestions ?false:true,
          title: strInformation,
          onTapSkip: (){
          provider.increaseIndex();

        },)
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                const SizedBox(width: 10,),
               /* Flexible(
                  child: Text(strDocumentDetails,
                    style: whiteBoldText26,
                  ),
                ),*/
                const SizedBox(width: 10,),
                CircularProgressIndicatorWidget(
                  level: '',
                  percentage: progressPercentage,
                  progressValue: taskCompletePercentage,
                  progressTypeValue: '',
                  docFillPercentage: docFillPercentage,
                ),
                const SizedBox(width: 10,),

              ],
            ),
            const SizedBox(height: 10,),
            _buildQuestionSeries(provider),
            Expanded(child: Container()),
            _buildButtonForNextQsn(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSeries(UserQuizzDataProvider provider){
    if(provider.QuestiionIndex == 0){
      return DropDownView(
        selectedValue: provider.userProfileModel.selectedDoc!,
        showDocsOptions: (){
          showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context, builder: (BuildContext context){
            return Wrap(

              children: [
                Container(

                  color: Colors.transparent,
                  child: Column(
                    children: [
                      ListView.builder(

                        itemBuilder: (context,index){

                          return  CurveContainerView(
                            text: docList[index],
                            onTapOption: (val){
                            if(provider.userProfileModel.selectedDoc!.isEmpty){
                              progressPercentage = Utils().calculatePercentage(progressPercentage);
                              taskCompletePercentage = Utils().convertPercentageToStr(progressPercentage);
                              docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);
                            }
                            provider.setDoc(val!);
                            Navigator.of(context).pop();

                            },
                          );
                        },
                        itemCount: docList.length,
                        shrinkWrap: true,
                      ),

                      //CurveContainerView(text: 'National Card',),
                      RoundButton(bgColor: Colors.black, btnTextStyle: greyText14, btnText: 'CANCEL', onTap: (){
                        Navigator.of(context).pop();
                      })
                    ],
                  ),
                ),
              ],
            );
          });
        },
      );
    }
    if(provider.QuestiionIndex == 1){
      return Column(
        children: [
          DropDownView(
            hintText: strNumber,
            showDropArrow: false,
            selectedValue: provider.userProfileModel.contactNumber!,
            showDocsOptions: (){
              _navigateToContactAddScreen(context,provider);

            },
          ),
          const SizedBox(height: 10,),
          DropDownView(
            hintText: strCountry,
            selectedValue: provider.userProfileModel.selctedCountry == null?'':provider.userProfileModel.selctedCountry!.name,
            showDocsOptions: (){
              /*showModalBottomSheet(
                    backgroundColor: Colors.white,
                  isScrollControlled: true,
                  useSafeArea: true,
                  context: context, builder: (BuildContext context){
                return Container(

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )
                  ),
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: CountryListScreen(
                    selectedCountry: provider.userProfileModel.selctedCountry,
                    onCountrySelect: (country){
                      if(provider.userProfileModel.selctedCountry == null){
                        progressPercentage = Utils().calculatePercentage(progressPercentage);
                        taskCompletePercentage = Utils().convertPercentageToStr(progressPercentage);
                        if(provider.userProfileModel.contactNumber!.isNotEmpty){
                          docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);
                        }


                      }
                      provider.setCountry(country);
                    //  provider.userProfileModel.selctedCountry = country;
                      if(provider.userProfileModel.contactNumber!.isNotEmpty){
                        provider.setBtnOpacity(1.0);

                      }

                    },
                  ),
                );
              });*/
              showDialog(context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context){
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    resizeToAvoidBottomInset: false,
                    body: Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height:MediaQuery.of(context).size.height * 0.80,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                )
                            ),
                            margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                            child: CountryListScreen(
                              selectedCountry: provider.userProfileModel.selctedCountry,
                              onCountrySelect: (country){
                                if(provider.userProfileModel.selctedCountry == null){
                                  progressPercentage = Utils().calculatePercentage(progressPercentage);
                                  taskCompletePercentage = Utils().convertPercentageToStr(progressPercentage);
                                  if(provider.userProfileModel.contactNumber!.isNotEmpty){
                                    docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);
                                  }
                      
                      
                                }
                                provider.setCountry(country);
                                //  provider.userProfileModel.selctedCountry = country;
                                if(provider.userProfileModel.contactNumber!.isNotEmpty){
                                  provider.setBtnOpacity(1.0);
                      
                                }
                      
                              },
                            ),
                          ),
                          const SizedBox(height: 20,),
                          RoundButton(bgColor: black,
                              btnTextStyle: whiteText12, btnText: 'Cancel', onTap: (){
                              Navigator.of(context).pop();
                          })
                        ],
                      ),
                    ),
                  );
                  }
              );

            },
          ),
        ],
      );
    }

    if(provider.QuestiionIndex == 2){
      return DropDownView(
        hintText: strPhoto,
        icon: Icons.camera_alt,
        iconColor:provider.userProfileModel.imageFileName!.isEmpty? grey: pink,
        selectedValue: provider.userProfileModel.imageFileName!,
        showDocsOptions: () async{
           userProfileModel = await Utils().pickImage(userProfileModel);
          if(userProfileModel.imageFile != null){

            _navigateToPhotoPlanningScreen(context,userProfileModel.imageFile!,provider);
          }

        },
      );
    }
    return Container();

  }
  void _navigateToPhotoPlanningScreen(BuildContext context,File imageFile,UserQuizzDataProvider provider) async{

    var result = await   Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoPlanningScreen(userProfileModel: userProfileModel,)));
    if(result['ImageFileName'] != null){
     // if(userProfileModel.imageFileName!.isEmpty){
        progressPercentage = Utils().calculatePercentage(progressPercentage);
        taskCompletePercentage = Utils().convertPercentageToStr(progressPercentage);
        docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);

     // }
    }
    provider.setProfileImage(imageFile,result['ImageFileName'] as String );
  //  userProfileModel.imageFileName = result['ImageFileName'] as String;
    // nextBtnOpacity = 1.0;
    provider.setBtnOpacity(1.0);

  }


  Widget _buildButtonForNextQsn(UserQuizzDataProvider provider){
    if(provider.QuestiionIndex == 0){
      return RoundButton(
        btnTextStyle: whiteText14,
        bgColor: pink, btnText: 'NEXT',
        onTap: (){
          provider.increaseIndex();
            provider.setBtnOpacity(0.4);
            },
        btnOpacity: provider.userProfileModel.selectedDoc!.isEmpty ?0.4:1.0,);
    }
    return  PrevAndNextButtonView(
      btnText: totalQuestions == provider.QuestiionIndex ?'FINISH':'NEXT',
      btnOpacity:provider.nextBtnOpacity,
      onTapPrevBtn: (){
        provider.decreaseIndex();

      },
      onTapNextBtn: (){
        if(totalQuestions == provider.QuestiionIndex){
          _navigateToQuizzEndScreen(context,provider);
          return;
        }
        if(provider.nextBtnOpacity == 1.0){
          provider.increaseIndex();
          provider.setBtnOpacity(0.4);
          //nextBtnOpacity = 0.4;

        }


      },
    );
  }

  void _navigateToContactAddScreen(BuildContext context,UserQuizzDataProvider provider) async{
   var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactNumberScreen()));
   if(result['Number'] != null){
     if(provider.userProfileModel.contactNumber!.isEmpty){
       progressPercentage = Utils().calculatePercentage(progressPercentage);
       taskCompletePercentage = Utils().convertPercentageToStr(progressPercentage);
        if(provider.userProfileModel.selctedCountry != null){
          docFillPercentage = Utils().calculatePercentageDocFill(docFillPercentage);
        }

     }
     provider.setContactNumber(result['Number'] as String);
   //  provider.userProfileModel.contactNumber = result['Number'] as String;
     if(provider.userProfileModel.selctedCountry != null){
      // nextBtnOpacity = 1.0;
       provider.setBtnOpacity(1);
     }

   }
  }
  void _navigateToQuizzEndScreen(BuildContext context,UserQuizzDataProvider provider) async{
    provider.resetData();
    Navigator.of(context).popUntil((route) => false);

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizzStartScreen(
      isQuizzCompleted: true,
      progressPercentage: progressPercentage,
      taskCompletePercentage: taskCompletePercentage,
      docFillPercentage: docFillPercentage,
    )));
  }



}
