import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/colors_app.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/generated/l10n.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -15, // Overlapping the bottom of the container
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.darkIndigo,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Text(
            S.of(context).consultation_fee,
            style:Styles.textStyleBookGold12(context),
          ),
        ),
      ),
    );
  }
}
