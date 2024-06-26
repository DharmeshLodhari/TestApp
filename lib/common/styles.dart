import 'package:flutter/material.dart';

const Color white = Colors.white;

Color pink = const Color(0xFFF864C5);
Color black = const Color(0xFF1D1D1F);
Color grey = const Color(0xFF6E6E73);
Color grey1 = const Color(0xFFAEAEB2);
Color grey2 = const Color(0xFFE3E3E3).withOpacity(0.5);

Color lightBlack = const Color(0xFF333333);
//Montserrat , ROBOTO
const TextStyle whiteText14AppBar =
    TextStyle(color: white, fontSize: 14.0, fontWeight: FontWeight.bold,fontFamily: 'Montserrat-Black');
const TextStyle whiteText20 = TextStyle(
    color: white,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat-Black');
const TextStyle whiteBoldText26 =
    TextStyle(color: white, fontSize: 24.0, fontFamily: 'Montserrat-Black');
const TextStyle whiteText14 = TextStyle(color: white, fontSize: 13.0,fontFamily: 'Montserrat-Bold');
 TextStyle whiteText14InPass = TextStyle(color: white.withOpacity(0.6), fontSize: 13.0,fontFamily: 'Montserrat');
const TextStyle whiteText13Bold = TextStyle(color: white, fontSize: 13.0,fontFamily: 'Montserrat-Bold');


TextStyle grey1Text14Bold =
    TextStyle(color: grey1, fontSize: 14.0, fontWeight: FontWeight.bold);
TextStyle greyText14Bold =
    TextStyle(color: grey, fontSize: 14.0, fontWeight: FontWeight.bold);
const TextStyle whiteText12 = TextStyle(color: white, fontSize: 12.0);

TextStyle blackText14 = TextStyle(color: black, fontSize: 13.0,fontFamily: 'Montserrat-Bold');
TextStyle greyText13 = TextStyle(color: grey2, fontSize: 13.0,fontFamily: 'Montserrat');
TextStyle blackText14Bold =
    TextStyle(color: black, fontSize: 14.0, fontWeight: FontWeight.bold);

TextStyle pinkText13 =
    TextStyle(color: pink, fontSize: 13.0, fontFamily: 'ROBOTO');
TextStyle pinkText14 =
    TextStyle(color: pink, fontSize: 13.0, fontFamily: 'Montserrat-Bold');
TextStyle pinkText20 =
    TextStyle(color: pink, fontSize: 20.0,fontFamily: 'Montserrat-Black');

TextStyle greyText14 = TextStyle(
  color: grey1,
  fontSize: 13.0,
    fontFamily: 'Montserrat-Bold'
);
TextStyle greyText14FF =
    TextStyle(color: grey, fontSize: 14.0, fontFamily: 'ROBOTO');

TextStyle greyText12 = TextStyle(color: grey, fontSize: 12.0,fontFamily: 'Montserrat');
TextStyle greyText12Roboto = TextStyle(color: grey, fontSize: 12.0,fontFamily: 'ROBOTO');
TextStyle greyText10FF =
    TextStyle(color: grey, fontSize: 10.0, fontFamily: 'ROBOTO');

BoxDecoration outlineBorder = BoxDecoration(
    border: Border.all(
      width: 0.5,
      color: pink,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(30)));
BoxDecoration outlineBorderWithPinkBg = BoxDecoration(
    border: Border.all(
      width: 0.5,
      color: pink,
      style: BorderStyle.solid,
    ),
    color: pink.withOpacity(0.17),
    borderRadius: const BorderRadius.all(Radius.circular(30)));

BoxDecoration outlineGreyBorder({Color? borderColor}) {
  borderColor ??= grey;
  return BoxDecoration(
      color: Colors.black,
      border: Border.all(
        width: 0.5,
        color: borderColor,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(25)));
}

BoxDecoration outlineGreyBorderAndBg = BoxDecoration(
    color: grey.withOpacity(0.5),
    border: Border.all(
      width: 0.5,
      color: grey.withOpacity(0.5),
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)));

BoxDecoration bgRectGrey = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      width: 0.5,
      color: Colors.transparent,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)));
BoxDecoration blackBg = BoxDecoration(
    color: black,
    border: Border.all(
      width: 0.5,
      color: black,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(20)));
