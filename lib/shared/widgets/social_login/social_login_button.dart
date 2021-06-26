import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_images.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(BorderSide(
            color: AppColors.stroke
          )),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(AppImages.google),
            ),
            Container(
              height: 56,
              color: AppColors.stroke,
              width: 0.5,
            ),
            Spacer(),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Entrar com Google",
                      style: TextStyles.buttonGray,
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