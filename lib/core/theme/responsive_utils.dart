import 'package:flutter/material.dart';

extension ResponsiveUtils on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Width Percentage
  double wp(double percentage) => screenWidth * (percentage / 100);

  /// Height Percentage
  double hp(double percentage) => screenHeight * (percentage / 100);

  /// Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape; // Fixed typo

  /// Spacing
  SizedBox vSpace(double percentage) => SizedBox(height: hp(percentage));
  SizedBox hSpace(double percentage) => SizedBox(width: wp(percentage));
}
