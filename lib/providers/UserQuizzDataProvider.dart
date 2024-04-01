import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:test_app/models/Country.dart';
import 'package:test_app/models/UserProfileModel.dart';

class UserQuizzDataProvider extends ChangeNotifier {
  UserProfileModel userProfileModel = UserProfileModel();
  int questionIndex = 0;
  double? nextBtnOpacity = 0.4;

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
    nextBtnOpacity = 0.4;
    userProfileModel = UserProfileModel();
    notifyListeners();
  }
}
