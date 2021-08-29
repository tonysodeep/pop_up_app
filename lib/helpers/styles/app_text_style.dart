import 'package:flutter/cupertino.dart';
import 'package:popup_dialog_sample/helpers/styles/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static final TextStyle _kBold = TextStyle(
    fontWeight: FontWeight.bold,
  );
  static final TextStyle _kNormal = TextStyle(
    fontWeight: FontWeight.normal,
  );

  static final TextStyle _kBoldMidnightBue = _kBold.copyWith(color: AppColor.midnight_blue);
  static final TextStyle _kNormalBlack = _kNormal.copyWith(color: AppColor.black);
  static final TextStyle _kBoldWhite = _kBold.copyWith(color: AppColor.white);
  static final TextStyle _kBoldTrinidad = _kBold.copyWith(color: AppColor.trinidad);

  static final TextStyle kBoldMidnightBue26 = _kBoldMidnightBue.copyWith(fontSize: 20);
  static final TextStyle kNormalBlack20 = _kNormalBlack.copyWith(fontSize: 15);
  static final TextStyle kBoldWhite26 = _kBoldWhite.copyWith(fontSize: 20);
  static final TextStyle kBoldTrinidad26 = _kBoldTrinidad.copyWith(fontSize: 20);

}
