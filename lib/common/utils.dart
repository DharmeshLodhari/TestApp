
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:test_app/common/styles.dart';
import 'package:test_app/models/country_model.dart';
import 'package:test_app/models/user_profile_model.dart';

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

  List<GaugeRange> test(UserProfileModel model){
    List<GaugeRange> segmentProgress =[GaugeRange(
      endWidth: 8,
      startWidth: 8,
      startValue: 0.0, endValue: 33.0,
      color: pink,
      rangeOffset: -2,

    ),
      GaugeRange(
        endWidth: 8,
        startWidth: 8,
        startValue: 33.0, endValue: 66.0,
        color: grey,
        rangeOffset: -2,

      ),
      GaugeRange(
        endWidth: 8,
        startWidth: 8,
        startValue: 67.0, endValue: 100.0,
        color: pink,
        rangeOffset: -2,

      )
    ];

    return segmentProgress;


  }
  Color getColors1(int index,String val){
    if(val.isEmpty){
      return grey;
    }
    /*if(index == 0 && val.isNotEmpty){
      return pink;
    }*/

    return pink;
  }
  Color getColors2(int index,String num,Country? country){
    if(num.isNotEmpty && country != null){
      return pink;
    }
    return grey;

  }
  Color getColors3(int index,String photo){
    if(photo.isEmpty){
      return grey;
    }

    return pink;
  }
  double getButtonOpacity(int index,UserProfileModel model){
    if(index == 0 && model.selectedDoc!.isNotEmpty){
      return 1.0;
    }
    if(index == 1 && model.contactNumber!.isNotEmpty){
      return 1.0;
    }
    if(index == 2 && model.imageFileName!.isNotEmpty){
      return 1.0;
    }
    return 0.15;

  }

  List<GaugeRange> getRangeList(int questionIndex,UserProfileModel model){
    List<GaugeRange> rangeList =[
      GaugeRange(
      endWidth: 8,
      startWidth: 8,
      startValue: 0.0, endValue: 33.0,
      color: Utils().getColors1(questionIndex,model.selectedDoc!),
      rangeOffset: -2,

    ),
    GaugeRange(
    endWidth: 8,
    startWidth: 8,
    startValue: 33.0, endValue: 66.66,
    color: Utils().getColors2(questionIndex,model.contactNumber!,model.selctedCountry),
    rangeOffset: -2,

    ),
      GaugeRange(
    endWidth: 8,
    startWidth: 8,
    startValue: 67.0, endValue: 100.0,
    color: Utils().getColors3(questionIndex,model.imageFileName!),
    rangeOffset: -2,
    )
    ];
    return rangeList;



  }

  double getFontSize(BuildContext context){
    double  width  =MediaQuery.of(context).size.width ;
    if(width < 400){
      return 22;
    }
    return 24 ;
  }


}