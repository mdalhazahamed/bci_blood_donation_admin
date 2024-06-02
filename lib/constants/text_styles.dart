import 'package:flutter/material.dart';

import 'app_constant.dart';

class ConstantTextStyles {
  static TextStyle titleBold18(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black)
            : TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppConstant.neutral10)
        : TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle title18(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 18, color: AppConstant.neutral90)
            : TextStyle(fontSize: 18, color: AppConstant.neutral10)
        : TextStyle(fontSize: 18, color: color);
  }

  static TextStyle bodyBold16(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)
            : TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)
        : TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle body16(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 16, color: Colors.black)
            : TextStyle(fontSize: 16, color: AppConstant.neutral10)
        : TextStyle(fontSize: 16, color: color);
  }

  static TextStyle subTitle14(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 14, color: Colors.black)
            : TextStyle(fontSize: 14, color: AppConstant.neutral20)
        : TextStyle(fontSize: 14, color: color);
  }

  static TextStyle bodySM14(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 14, color: AppConstant.neutral60)
            : TextStyle(fontSize: 14, color: AppConstant.neutral20)
        : TextStyle(fontSize: 14, color: color);
  }

  static TextStyle titleBold24(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 24, color: AppConstant.neutral90)
            : TextStyle(fontSize: 24, color: Colors.white)
        : TextStyle(fontSize: 24, color: color);
  }

  static TextStyle subTitle12(BuildContext context, [Color? color]) {
    return color == null
        ? Theme.of(context).brightness == Brightness.light
            ? TextStyle(fontSize: 12, color: AppConstant.neutral70)
            : TextStyle(fontSize: 12, color: AppConstant.neutral60)
        : TextStyle(fontSize: 12, color: color);
  }
}
