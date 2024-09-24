import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/colors_app.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/generated/l10n.dart';

class BillDetailsContainer extends StatelessWidget {
  const BillDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 40,
            spreadRadius: 2,
            offset: const Offset(0, 25)
          ),
        ],
      ),
      child: Column(
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).bill_details,
            style: Styles.textStyleBook15(context),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).general_consultation_type ,
               style: Styles.textStyleBookGrey12(context),),
               const Spacer(),
               const Expanded(
                flex: 4,
                child:  Divider( color: AppColors.darkGold, )),
                const Spacer(),
              Text(
                S.of(context).criminal_law,
                style: Styles.textStyleBookIndigo12(context),
              ),
            ]
          ),
          SizedBox(height: 12.h),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).sub_consultation_type ,
               style: Styles.textStyleBookGrey12(context),),
             const Spacer(),
               const Expanded(
                flex: 4,
                child:  Divider( color: AppColors.darkGold, )),
                const Spacer(),
              Text(
                S.of(context).harassment,
                style: Styles.textStyleBookIndigo12(context),
              ),
            ]
          ),
        SizedBox(height: 45.h),
        ],
      ),
    );
  }
}