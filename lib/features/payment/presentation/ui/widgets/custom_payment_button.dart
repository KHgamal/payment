import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/colors_app.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/generated/l10n.dart';

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.pop(context),
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0).w,
          boxShadow:  [
            BoxShadow(
              color: AppColors.shadowRed,
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 15), // (horizontal, vertical)
            ),
          ],
          gradient: const LinearGradient(
            colors: [
            AppColors.darkRed ,
             AppColors.lightRed
            ],
            end: Alignment.bottomLeft,
            begin: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Text(S.of(context).confirm_payment,
              style: Styles.textStyleBook14(context)),
        ),
      ),
    );
  }
}