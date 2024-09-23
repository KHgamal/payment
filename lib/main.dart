import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/core/common/styles/colors_app.dart';
import 'package:payment/core/common/styles/media.dart';
import 'package:payment/core/common/styles/text_style.dart';
import 'package:payment/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 981),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            //routerConfig: appRouter.config(),
            locale: const Locale("ar"),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: false,
              fontFamily: 'Noor',
            ),
            debugShowCheckedModeBanner: false,
            title: 'Qanony',
            home: const PaymentView(),
          );
        });
  }
}

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header(),
            CustomPaymentButton()
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).payment,
            style: Styles.textStyleBook20(context),
          ),
          const CustomIconButton(
            icon: Assets.assetsImagesArrowLeft,
            // onTap: () => context.router.back(),
          ),
        ],
      ),
    );
  }
}

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

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => Navigator.pop(context),
      child: Container(
        width: ScreenUtil().setWidth(90),
        height: 45.h,
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
        child: Text(S.of(context).confirm_payment,
            style: Styles.textStyleBook14(context)),
      ),
    );
  }
}
