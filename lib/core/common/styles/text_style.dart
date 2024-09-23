import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/colors_app.dart';

class Styles {
  static TextStyle textStyleBookIndigo12(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12.sp),
        fontWeight: FontWeight.w400,
        color: AppColors.darkIndigo,
      );

  static TextStyle textStyleBookGrey12(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12.sp),
        fontWeight: FontWeight.w400,
        color: AppColors.darkGrey,
      );

  static TextStyle textStyleBookGold12(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12.sp),
        fontWeight: FontWeight.w700,
        color: AppColors.darkGold,
      );

  static TextStyle textStyleBook10(context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10.sp),
        fontWeight: FontWeight.w400,
        color: AppColors.darkGold,
      );

  static TextStyle textStyleBook14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14.sp),
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

 static TextStyle textStyleBook13(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13.sp),
      fontWeight: FontWeight.w400,
      color: AppColors.darkIndigo,
    );
  }

    static TextStyle textStyleBook11(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 11.sp),
      fontWeight: FontWeight.w700,
      color: AppColors.darkGold,
    );
  }

  static TextStyle textStyleBook15(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15.sp),
      fontWeight: FontWeight.w400,
      color: AppColors.darkGold,
    );
  }

  static TextStyle textStyleBook20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20.sp),
      fontWeight: FontWeight.w400,
      color: AppColors.darkIndigo,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 450;
  } else if (width < 900) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
