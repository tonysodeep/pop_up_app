import 'package:flutter/material.dart';
import 'package:popup_dialog_sample/helpers/styles/app_color.dart';
import 'package:popup_dialog_sample/helpers/styles/app_text_style.dart';

class PopUpButton extends StatelessWidget {
  final bool isPrimary;
  final String buttonText;
  final onPressed;

  const PopUpButton({
    Key? key,
    required this.isPrimary,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isPrimary ? AppColor.trinidad : AppColor.white,
        border:
            isPrimary ? null : Border.all(color: AppColor.trinidad, width: 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        child: Text(
          buttonText,
          style: isPrimary
              ? AppTextStyle.kBoldWhite26
              : AppTextStyle.kBoldTrinidad26,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
