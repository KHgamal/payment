import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/common/styles/colors_app.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final String icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: size * 0.141025,
          height: size * 0.141025,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.mediumGold),
              borderRadius: BorderRadius.circular(10).w),
          child: SvgPicture.asset(icon,
              width: ScreenUtil().setWidth(20), fit: BoxFit.scaleDown)),
    );
  }
}