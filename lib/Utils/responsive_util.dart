import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;


}
