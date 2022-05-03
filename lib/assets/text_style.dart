import 'package:flutter/material.dart';
import 'package:yellowbox/assets/color.dart';

const smallestSize = 10.0;
const smallSize = 12.0;
const regularSize = 16.0;
const mediumSize = 18.0;
const bigSize = 24.0;
const veryBigSize = 38.0;

const String Mitr = 'Mitr';
const String Poppins = 'Poppins';
const String SourceCode = 'SourceCode';

class FontCollection {

  static const mainTitle = TextStyle(
    fontFamily: Poppins,
    fontWeight: FontWeight.w600,
    fontSize:  veryBigSize,
    color: CollectionsColors.orange,
  );

  static const title = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  bigSize,
    color: CollectionsColors.navy,
  );

  static const subTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  mediumSize,
    color: CollectionsColors.navy,
  );

  static const body = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.navy,
  );

  static const buttonText = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: Colors.white,
  );

  static const boldBody = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w500,
    fontSize:  regularSize,
    color: CollectionsColors.navy,
  );

  static const navbar = TextStyle(
    fontFamily: Poppins,
    fontWeight: FontWeight.w600,
    fontSize:  regularSize,
    color: CollectionsColors.navy,
  );

  static const output = TextStyle(
    fontFamily: SourceCode,
    fontWeight: FontWeight.w600,
    fontSize:  regularSize,
    color: CollectionsColors.blue,
  );

  //Orange text

  static const orangeTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  bigSize,
    color: CollectionsColors.orange,
  );

  static const orangeSubTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  mediumSize,
    color: CollectionsColors.orange,
  );

  static const orangeBody = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.orange,
  );

  static const orangeButtonText = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.orange,
  );

  //white text

  static const whiteTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  bigSize,
    color: CollectionsColors.white,
  );

  static const whiteSubTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  mediumSize,
    color: CollectionsColors.white,
  );

  static const whiteBody = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.white,
  );

  static const whiteButtonText = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.white,
  );

  //red text

  static const redDetail = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  smallSize,
    color: CollectionsColors.red,
  );

  //Disable text
  static const disTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  bigSize,
    color: CollectionsColors.grey,
  );

  static const disSubTitle = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  mediumSize,
    color: CollectionsColors.grey,
  );

  static const disBody = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  regularSize,
    color: CollectionsColors.grey,
  );

  static const disDetail = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  smallSize,
    color: CollectionsColors.grey,
  );

  static const disSmallest = TextStyle(
    fontFamily: Mitr,
    fontWeight: FontWeight.w400,
    fontSize:  smallestSize,
    color: CollectionsColors.grey,
  );


  static const disNavbar = TextStyle(
    fontFamily: Poppins,
    fontWeight: FontWeight.w600,
    fontSize:  regularSize,
    color: CollectionsColors.grey,
  );
}

Widget mainTitleText({required String text}) {
  return Text(
    text, style: FontCollection.mainTitle,
  );
}

Widget subTitleText({required String text}) {
  return Text(
    text, style: FontCollection.subTitle,
  );
}

Widget bodyText({required String text}) {
  return Text(
    text, style: FontCollection.subTitle,
  );
}
