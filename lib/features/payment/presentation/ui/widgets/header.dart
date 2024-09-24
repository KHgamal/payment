import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/media.dart';
import 'package:payment/features/payment/presentation/ui/widgets/custom_icon_button.dart';
import 'package:payment/generated/l10n.dart';

import '../../../../../core/common/styles/text_style.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          const EdgeInsets.only(top: 14, right: 20, left: 20, bottom: 20).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          SizedBox(width:  size * 0.141025 ,),
          Text(
            S.of(context).payment,
            style: Styles.textStyleBook20(context),
          ),
          const Spacer(),
          const CustomIconButton(
            icon: Assets.assetsImagesArrowLeft,
          ),
        ],
      ),
    );
  }
}