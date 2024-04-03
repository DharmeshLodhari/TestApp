import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_app/models/country_model.dart';
import 'package:test_app/models/user_profile_model.dart';

class UserQuizzDataProvider extends ChangeNotifier {
  UserProfileModel userProfileModel = UserProfileModel();
  int questionIndex = 0;
  double? nextBtnOpacity = 0.15;

  void setDoc(String docName) {
    userProfileModel.selectedDoc = docName;
    notifyListeners();
  }

  void setContactNumber(String number) {
    userProfileModel.contactNumber = number;
    notifyListeners();
  }

  void setCountry(Country countryModel) {
    userProfileModel.selctedCountry = countryModel;
    notifyListeners();
  }

  void setProfileImage(File file, String fileName) {
    userProfileModel.imageFile = file;
    userProfileModel.imageFileName = fileName;
    notifyListeners();
  }

  void increaseIndex() {
    questionIndex++;
    notifyListeners();
  }

  void decreaseIndex() {
    questionIndex--;
    notifyListeners();
  }

  void setBtnOpacity(double opacity) {
    nextBtnOpacity = opacity;
    notifyListeners();
  }

  void resetData() {
    questionIndex = 0;
    nextBtnOpacity = 0.15;
    userProfileModel = UserProfileModel();
    notifyListeners();
  }

  double getButtonOpacity(){
    if(questionIndex == 0 && userProfileModel.selectedDoc!.isNotEmpty){
      nextBtnOpacity = 1.0;
    }
    if(questionIndex == 1 && userProfileModel.contactNumber!.isNotEmpty || questionIndex == 1 && userProfileModel.selctedCountry != null ){
      nextBtnOpacity = 1.0;
    }
    if(questionIndex == 2 && userProfileModel.imageFileName!.isNotEmpty){
      nextBtnOpacity = 1.0;
    }
    return nextBtnOpacity!;
  }
}
