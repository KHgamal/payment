import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:payment/core/utils/helpers/di/injectable_config.dart';
import 'package:payment/features/payment/presentation/controller/check_provider.dart';
import 'package:payment/features/payment/presentation/ui/views/payment_view.dart';
import 'package:payment/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
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
            home: ChangeNotifierProvider(
              create: (_) => CheckboxModel(),
              child: const PaymentView(),
            ),
          );
        });
  }
}
