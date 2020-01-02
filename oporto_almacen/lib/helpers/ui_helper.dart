import 'package:flutter/cupertino.dart';

class UiHelper {
  static getWidth(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return w;
  }

  static getHeight(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return h;
  }

  static getOrientation(BuildContext context) {
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      return Orientation.portrait;
    } else {
      return Orientation.landscape;
    }
  }
}
