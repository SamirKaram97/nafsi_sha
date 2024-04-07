import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/styles/colors.dart';

import 'fonts.dart';

class AppStyles
{

static TextStyle mRegular16(context){
  return const TextStyle(
    color: Color(0xFF100F11),
    fontSize: 16,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.regular,
  );
}

static TextStyle mRegular14(context){
  return const TextStyle(
    color: Color(0xFF100F11),
    fontSize: 14,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.regular,
  );
}

static TextStyle mSemiBold12(context){
  return const TextStyle(
    color: Color(0xFF404040),
    fontSize: 12,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );
}


static TextStyle mSemiBold18(context){
  return const TextStyle(
    color: Color(0xFF292A28),
    fontSize: 18,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );

}
static TextStyle mSemiBold20(context){
  return const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );

}static TextStyle mBold26(context){
  return const TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );

}
static TextStyle mBold22(context){
  return const TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );

}

static TextStyle mBold14(context){
  return const TextStyle(
    color: AppColors.primaryColorA,
    fontSize: 14,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mExtraBold14(context){
  return const TextStyle(
    color: AppColors.pinkColor,
    fontSize: 14,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mExtraBold50(context){
  return const TextStyle(
    color: Colors.black,
    fontSize: 50,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mExtraBold35(context){
  return const TextStyle(
    color: Colors.black,
    fontSize: 35,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.extraBold,
  );
}
static TextStyle mBold18(context){
  return const TextStyle(
    color: Color(0XFF2C2B49),
    fontSize: 18,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mBold16(context){
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}
static TextStyle mBold12(context){
  return const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 12,
    fontFamily: FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.bold,
  );
}

static TextStyle mSemiBold38(context){
  return const TextStyle(
    color: Color(0xFF252625),
    fontSize: 38,
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.semiBold,
  );
}

static TextStyle rBold16(context){
  return const TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    fontFamily: FontConstants.robotoFontFamily,
    fontWeight: FontWeightManger.bold,
  );
}

static TextStyle rLight16(context){
  return TextStyle(
    color: AppColors.blackWith60,
    fontSize: 16,
    fontFamily: FontConstants.robotoFontFamily,
    fontWeight: FontWeightManger.light,
  );
}

static TextStyle mMedium14(context){
  return TextStyle(
    color: AppColors.blackWith60,
    fontSize: 14,
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium12(context){
  return TextStyle(
    color: AppColors.black2,
    fontSize: 12,
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium18(context){
  return const TextStyle(
    color: Color(0XFF100F11),
    fontSize: 18,
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}
static TextStyle mMedium16(context){
  return  TextStyle(
    color: AppColors.blackWith75,
    fontSize: 16,
    fontFamily:FontConstants.manropeFontsFamily,
    fontWeight: FontWeightManger.medium,
  );
}

static TextStyle aRegular16(context){
  return  const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontFamily:FontConstants.aksharFontsFamily,
    fontWeight: FontWeightManger.regular,
      height:1.25

  );
}

static TextStyle aLight16(context){
  return  const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily:FontConstants.aksharFontsFamily,
    fontWeight: FontWeightManger.light,
      height:1.25
  );
}


}