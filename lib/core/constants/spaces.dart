import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spaces {
  static double xSmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double xLarge = 32;
  static const double xxLarge = 38;

  static const double spBetweenItem = medium;
  static const double spBetweenSection = xLarge;

  static const double btnPadding = medium;
  static const double btnPaddingLg = large;

  static SizedBox verticalSpace(double height) => SizedBox(height: height.h);
  static SizedBox horizontalSpace(double width) => SizedBox(width: width.w);
}
