import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: FontFamily.Poppins,
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: FontFamily.Poppins,
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFD900),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class FontFamily {
  FontFamily._();

  static String Poppins = "Poppins";
}

class Media {
  late MediaQueryData _mediaQueryData;
  late double width;
  late double height;
  late bool isHorizontal;
  late bool isVertical;
  late double ratio;

  Media(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    isVertical = _mediaQueryData.orientation == Orientation.portrait;
    isHorizontal = _mediaQueryData.orientation == Orientation.landscape;
    ratio = (isVertical ? height : width) * 0.0012;
  }
}
