import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/utils/widget_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  IconData prefixIcon;
  String text;
  Color iconColor;

  CustomText({this.prefixIcon,this.text,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(prefixIcon,
          color: iconColor,
        size: 24.0,),
        horizontalMargin(8.0),
        Text(text,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 14.0
              )
          ),)
      ],
    );
  }
}
