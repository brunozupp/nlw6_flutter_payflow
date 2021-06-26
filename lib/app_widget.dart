import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw6_payflow_flutter/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw6_payflow_flutter/modules/home/home_page.dart';
import 'package:nlw6_payflow_flutter/modules/insert_boleto/insert_boleto_page.dart';
import 'package:nlw6_payflow_flutter/modules/login/login_page.dart';
import 'package:nlw6_payflow_flutter/modules/splash/splash_page.dart';
import 'package:nlw6_payflow_flutter/shared/models/user_model.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  
  // Travar a parte de orientação. Só vai poder virar na parte do boleto
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange
      ),
      initialRoute: '/splash',
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
          user: ModalRoute.of(context)!.settings.arguments as UserModel
        ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
          barcode: ModalRoute.of(context) != null
            ? ModalRoute.of(context)!.settings.arguments as String
            : null,
        ),
      }
    );
  }
}