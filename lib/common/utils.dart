
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/models/UserProfileModel.dart';

class Utils {
  double calculatePercentage(double per){
    if(per ==  1.0){
      return per;
    }
    return per + 0.25;
  }
  double calculatePercentageDocFill(double per){
    if(per ==  100){
      return per;
    }
    return per + 33.33;
  }

  String convertPercentageToStr(double per){

    double temp = per * 100 ;
    return '${temp.toInt()}%';
  }
 Future<UserProfileModel> pickImage(UserProfileModel model) async{
    final XFile? pickedFile  = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,

    );

    if(pickedFile  != null){

      model.imageFile  = File(pickedFile.path);
      model.imageFileName = pickedFile.name;

    }
    return model;
  }

  double getDotPosition(int segmentIndex){

    if(segmentIndex == 0){
      return 330;
    }
    if(segmentIndex == 1){
      return 90;
    }
    return 210;
  }

  double getHeightOfPhoto(BuildContext context,bool showCardView){
    if(MediaQuery.of(context).orientation == Orientation.landscape){

      return 380;
    }
    return MediaQuery.of(context).size.height *0.38;
        //(showCardView ? 0.45 : );
  }
  double getWidthOfCard(BuildContext context,){
    if(MediaQuery.of(context).orientation == Orientation.landscape){

      return 250;
    }
    return MediaQuery.of(context).size.width * 0.65;
  }

}