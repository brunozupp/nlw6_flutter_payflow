import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  final String? initialValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;

  const InputTextWidget({
    Key? key, 
    required this.label, 
    required this.icon,
    this.initialValue, 
    this.controller, 
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              validator: validator,
              onChanged: onChanged,
              initialValue: initialValue,
              style: TextStyles.input,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: TextStyles.input,
                border: InputBorder.none,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.stroke,
                    ),
                  ],
                )
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ],
        ),
      ),
    );
  }
}