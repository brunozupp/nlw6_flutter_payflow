import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw6_payflow_flutter/modules/login/login_controller.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_images.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw6_payflow_flutter/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = LoginController();
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 47,
              child: Image.asset(
                AppImages.person,
                height: 373,
                width: 208,
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.logomini
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                      "Organize seus\nboletos em um\nsó lugar",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SocialLoginButton(
                      onTap: () async => await controller.googleSignIn(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}