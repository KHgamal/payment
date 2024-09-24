import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/common/styles/colors_app.dart';
import 'package:payment/core/common/styles/media.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/features/payment/presentation/controller/check_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';
// Replace with your custom file for AppColors, Styles, etc.

class PaymentOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String icon;
  final List<String>? customIcons;
  final int value;

  const PaymentOption({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.customIcons,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final checkboxModel = Provider.of<CheckboxModel>(context);
    return GestureDetector(
      onTap: () => checkboxModel.toggleCheckbox(value),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: AppColors.mediumGold), // Custom color
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.w), // Custom padding
              decoration: BoxDecoration(
                color: AppColors.darkIndigo, // Custom color
                borderRadius: BorderRadius.circular(10.w), // Custom radius
              ),
              child: SvgPicture.asset(
                icon,
                width: 20.w, // Custom size
                height: 20.h, // Custom size
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            // Title and Subtitle/Custom Icons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text
                  Text(
                    title,
                    style: Styles.textStyleBook13(context), // Custom text style
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  // Subtitle or Custom Icons Row
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style:
                          Styles.textStyleBook11(context), // Custom text style
                    )
                  else if (customIcons != null)
                    Row(
                      children: customIcons!.map((iconPath) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w), // Custom padding
                          child: Image.asset(
                            iconPath,
                            width: 19.w,
                            height: 19.h, // Custom size
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
             if (value==2) Image.asset(
                            Assets.assetsImagesMizaa,
                            width: 47.w,
                            height: 19.h, // Custom size
                          ),
            SvgPicture.asset(checkboxModel.selectedIndex == value
                ? Assets.assetsImagesTickSquareGreen
                : Assets.assetsImagesTickSquare),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
      ),
    );
  }
}
