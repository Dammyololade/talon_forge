import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin UIKits {
  Widget height(double val) => SizedBox(height: val);

  Widget width(double val) => SizedBox(width: val);

  Widget formSpace() => height(16.h);

  Widget formEndSpace() => height(24.h);

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  ColorScheme colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

}
