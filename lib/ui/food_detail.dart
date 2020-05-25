import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/widget_utils.dart';
import 'package:flutter_challenge/widgets/custom_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetail extends StatelessWidget {

  final colorRed = Colors.redAccent.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildProductImage(),
              verticalMargin(16.0),
              buildProductTitle(),
              verticalMargin(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    prefixIcon: Icons.star,
                    text: '4.5',
                    iconColor: Colors.orange,
                  ),
                  CustomText(
                    prefixIcon: Icons.access_time,
                    text: '18 min',
                    iconColor: colorRed,
                  ),
                  CustomText(
                    prefixIcon: FontAwesomeIcons.locationArrow,
                    text: '2.3 km',
                    iconColor: colorRed,
                  )
                ],
              ),
              verticalMargin(20.0),
              Text('Overview',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0
                )
              ),),
              verticalMargin(8.0),
              Expanded(
                child: Text('Lorem Ipsum is simply dupesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since thes, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised the release of Letraset sheets containing Lorem Ipsum passages, and more recenp publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0
                  )
                ),),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  buildProductImage() {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 340,
          child: Center(
            child: Image.asset('images/salad.jpeg',
              width: 300,
              height: 200.0,),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          child: Icon(Icons.arrow_back_ios,
            color: Colors.grey,),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 24,
            ),
          ),
        )
      ],
    );
  }

  buildProductTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Chicken Wadges',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400
              )
            ),),
            verticalMargin(8.0),
            Row(
              children: <Widget>[
                Icon(Icons.location_on,
                  color: colorRed,),
                horizontalMargin(4.0),
                Text('Rio Cafe',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0
                      )
                  ),)
              ],
            )
          ],
        ),
        Text('\$ 80',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: colorRed,
            fontSize: 20
          )
        ),)
      ],
    );
  }
}
