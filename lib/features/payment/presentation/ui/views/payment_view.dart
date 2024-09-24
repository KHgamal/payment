import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/styles/media.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/features/payment/presentation/ui/widgets/bill_details_container.dart';
import 'package:payment/features/payment/presentation/ui/widgets/custom_payment_button.dart';
import 'package:payment/features/payment/presentation/ui/widgets/header.dart';
import 'package:payment/features/payment/presentation/ui/widgets/payment_option.dart';
import 'package:payment/generated/l10n.dart';

import '../widgets/price_container.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Header(),
                const Stack(
                  clipBehavior: Clip.none,
                  children: [
                     BillDetailsContainer(),
                     PriceContainer(),
                  ],
                ),
                SizedBox(height: 60.h), // Added extra space for the overlap
                PaymentOption(
                  title: S.of(context).wallet_balance,
                  subtitle: S.of(context).wallet_balance_value,
                  icon:Assets.assetsImagesWalletCheck,
                  value: 1,
                ),
                PaymentOption(
                  title: S.of(context).credit_card,
                  subtitle: '**** **** **** 1245',
                  icon:Assets.assetsImagesCard,
                  value: 2,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:  EdgeInsets.only(left: 16.w, top: 3.h),
                    child: Text(
                       S.of(context).add_new_card,
                      style:Styles.textStyleBook10(context),
                    ),
                  ),
                ),
                 SizedBox(height: 18.h),
                 PaymentOption(
                  title: S.of(context).e_wallet,
                 // subtitle: '**** **** **** 1245',
                  icon:Assets.assetsImagesMoneySend,
                  customIcons: const [
                    Assets.assetsImagesCash,
                    Assets.assetsImagesOrange,
                    Assets.assetsImagesEtislat,
                    Assets.assetsImagesPhoneCash,
                    Assets.assetsImagesQahera,
                    Assets.assetsImagesCib
                  ],
                  value: 3,
                ),
                SizedBox(height: 40.h),
                const CustomPaymentButton(),
                //const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}