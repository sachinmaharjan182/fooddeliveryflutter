import 'package:flutter/cupertino.dart';

final verticalMarginMedium = SizedBox(
  height: 32.0,
);

Widget verticalMargin(double margin){
  return SizedBox(
    height: margin,
  );
}

Widget horizontalMargin(double margin){
  return SizedBox(
    width: margin,
  );
}