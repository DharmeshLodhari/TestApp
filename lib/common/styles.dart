import 'dart:math';

import 'package:flutter/material.dart';

const Color white = Colors.white;

Color pink =  Color(0xFFF864C5);
Color black =  Color(0xFF1D1D1F);
Color grey = const Color(0xFF6E6E73);
Color grey1 = const Color(0xFFAEAEB2);

Color lightBlack = const Color(0xFF333333);

const TextStyle whiteText14AppBar = TextStyle(color: white, fontSize: 14.0,fontWeight: FontWeight.bold);
const TextStyle whiteText20 = TextStyle(color: white, fontSize: 24.0,fontWeight: FontWeight.bold,fontFamily: 'Montserrat');
const TextStyle whiteBoldText26 = TextStyle(color: white, fontSize: 26.0,fontWeight: FontWeight.bold);
const TextStyle whiteText14 = TextStyle(color: white, fontSize: 14.0);
const TextStyle whiteText14FF = TextStyle(color: white, fontSize: 14.0,fontFamily: 'ROBOTO');
const TextStyle whiteText14Bold = TextStyle(color: white, fontSize: 14.0,fontWeight: FontWeight.bold);
 TextStyle greyText14Bold = TextStyle(color: grey1, fontSize: 14.0,fontWeight: FontWeight.bold);
const TextStyle whiteText12 = TextStyle(color: white, fontSize: 12.0);

 TextStyle blackText14 = TextStyle(color: black, fontSize: 14.0);
 TextStyle blackText14Bold = TextStyle(color: black, fontSize: 14.0,fontWeight: FontWeight.bold);

 TextStyle pinkText10 = TextStyle(color: pink, fontSize: 13.0,fontFamily: 'ROBOTO');
 TextStyle pinkText14 = TextStyle(color: pink, fontSize: 14.0,fontWeight: FontWeight.bold);
 TextStyle pinkText22 = TextStyle(color: pink, fontSize: 22.0,fontWeight: FontWeight.bold);

 TextStyle greyText14 = TextStyle(color: grey, fontSize: 14.0,);
 TextStyle greyText14FF = TextStyle(color: grey, fontSize: 14.0,fontFamily: 'ROBOTO');
 TextStyle greyText10 = TextStyle(color: grey, fontSize: 10.0);
 TextStyle greyText12 = TextStyle(color: grey, fontSize: 12.0);
 TextStyle greyText10FF = TextStyle(color: grey, fontSize: 10.0,fontFamily: 'ROBOTO');


 BoxDecoration outlineBorder = BoxDecoration(
     border: Border.all(
      width: 0.5,
      color: pink,
      style: BorderStyle.solid,
     ),

     borderRadius: BorderRadius.all(Radius.circular(30))
 );
BoxDecoration outlineBorderWithPinkBg = BoxDecoration(
    border: Border.all(
      width: 0.5,
      color: pink,
      style: BorderStyle.solid,
    ),
    color: pink.withOpacity(0.17),
    borderRadius: BorderRadius.all(Radius.circular(30))
);

BoxDecoration outlineGreyBorder = BoxDecoration(
  color: Colors.black,
    border: Border.all(
      width: 0.5,
      color: grey,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
);

BoxDecoration outlineGreyBorderAndBg = BoxDecoration(
    color: grey.withOpacity(0.5),
    border: Border.all(
      width: 0.5,
      color: grey.withOpacity(0.5),
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
);

BoxDecoration bgRectGrey = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      width: 0.5,
      color:Colors.transparent,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
);
BoxDecoration blackBg =  BoxDecoration(
    color: black,
    border: Border.all(
      width: 0.5,
      color: black,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
);

