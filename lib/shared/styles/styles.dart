import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import 'fonts.dart';

class AppStyles
{

static TextStyle mRegular16(context){
  return  TextStyle(
    color: const Color(0xFF100F11),
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.regular,
  );
}

static TextStyle mRegular14(context){
  return  TextStyle(
    color: const Color(0xFF100F11),
    fontSize: getResponsiveFontSize(context,fontSize: 14),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.regular,
  );
}

static TextStyle mSemiBold12(context){
  return  TextStyle(
    color: Color(0xFF404040),
    fontSize: getResponsiveFontSize(context,fontSize: 12),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );
}


static TextStyle mSemiBold18(context){
  return  TextStyle(
    color: Color(0xFF292A28),
    fontSize: getResponsiveFontSize(context,fontSize: 18),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );

}
static TextStyle mSemiBold20(context){
  return  TextStyle(
    color: AppColors.whiteColor,
    fontSize: getResponsiveFontSize(context,fontSize: 20),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );

}static TextStyle mBold26(context){
  return  TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 26),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );

}
static TextStyle mBold22(context){
  return  TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 22),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );

}

static TextStyle mBold14(context){
  return  TextStyle(
    color: AppColors.primaryColorA,
    fontSize: getResponsiveFontSize(context,fontSize: 14),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mExtraBold14(context){
  return  TextStyle(
    color: AppColors.pinkColor,
    fontSize: getResponsiveFontSize(context,fontSize: 14),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mExtraBold50(context){
  return  TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 50),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mExtraBold35(context){
  return  TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 35),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mBold18(context){
  return  TextStyle(
    color: Color(0XFF2C2B49),
    fontSize: getResponsiveFontSize(context,fontSize: 18),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mBold16(context){
  return  TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mBold12(context){
  return  TextStyle(
    color: AppColors.primaryColor,
    fontSize: getResponsiveFontSize(context,fontSize: 12),
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}

static TextStyle mSemiBold38(context){
  return  TextStyle(
    color: Color(0xFF252625),
    fontSize: getResponsiveFontSize(context,fontSize: 38),
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );
}

static TextStyle rBold16(context){
  return  TextStyle(
    color: const Color(0xFFFFFFFF),
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily: FontConstants.robotoFontFamily,
    fontWeight: FontWeightManger.bold,
  );
}

static TextStyle rLight16(context){
  return TextStyle(
    color: AppColors.blackWith60,
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily: FontConstants.robotoFontFamily,
    fontWeight: FontWeightManger.light,
  );
}

static TextStyle mMedium14(context){
  return TextStyle(
    color: AppColors.blackWith60,
    fontSize: getResponsiveFontSize(context,fontSize: 14),
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium12(context){
  return TextStyle(
    color: AppColors.black2,
    fontSize: getResponsiveFontSize(context,fontSize: 12),
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium18(context){
  return  TextStyle(
    color: Color(0XFF100F11),
    fontSize: getResponsiveFontSize(context,fontSize: 18),
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium16(context){
  return  TextStyle(
    color: AppColors.blackWith75,
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}

static TextStyle aRegular16(context){
  return   TextStyle(
    color: AppColors.whiteColor,
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily:FontConstants.aksharFontsFamily,
    fontWeight: FontWeightManger.regular,
      height:1.25

  );
}

static TextStyle aLight16(context){
  return   TextStyle(
    color: Colors.black,
    fontSize: getResponsiveFontSize(context,fontSize: 16),
    fontFamily:FontConstants.aksharFontsFamily,
    fontWeight: FontWeightManger.light,
      height:1.25
  );
}


}


// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .75;
  double upperLimit = fontSize * 1.25;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 500;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
