import 'package:flutter/material.dart';

// sacleFactor
// Responsive Font Size


double getResponsiveFontSize(
    BuildContext context,
    {required double fontSize})
{
  double scaleFactor = calcScaleFactor(context);
  double responsFontSize = fontSize * scaleFactor;

  // (Min , Max ) Font Size ( add a limit to Font Size )
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsFontSize.clamp(lowerLimit, upperLimit);
}

// Scale Factor Method
double calcScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 600;
  } else {
    return width / 1000;
  }
}