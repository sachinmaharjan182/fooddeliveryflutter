import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/widget_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  final drawerTextStyle = GoogleFonts.poppins(
    textStyle : TextStyle(
      fontSize: 16.0,
      color: Colors.white
    )
  );

  final drawerIconColor = Colors.white.withOpacity(0.5);
  final drawerIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        color: Color(0xFFB4ABA4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              verticalMargin(16.0),
              buildTopBar(),
              verticalMarginMedium,
              buildMenus()
            ],
          )
          ),
        ),
      ),
    );
  }

  buildTopBar() {
    return   Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
//        CircleAvatar(
//          backgroundImage: ExactAssetImage('images/avatar.jpg'),
//        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            image: DecorationImage(image: ExactAssetImage('images/avatar.jpg')),
            borderRadius: BorderRadius.all(
              Radius.circular(16)
            ),
          ),
        ),
        horizontalMargin(8.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Talylor Swift',
              style: GoogleFonts.poppins(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),),
            Text('taylorswift@gmail.com',
              style: GoogleFonts.poppins(
                  fontSize: 11.0
              ),),
          ],
        )
      ],
    );
  }

  buildMenus() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text('Restaurant',
            style: drawerTextStyle,),
            leading: Icon(FontAwesomeIcons.utensils,
            size: drawerIconSize,
                color: drawerIconColor,),
          ),
          ListTile(
            title: Text('My Cart',
              style: drawerTextStyle,),
            leading: Icon(FontAwesomeIcons.shoppingCart,
              size: drawerIconSize,
              color: drawerIconColor,),
          ),
          ListTile(
            title: Text('Nearby Hotel',
              style: drawerTextStyle,),
            leading: Icon(FontAwesomeIcons.locationArrow,
              size: drawerIconSize,
              color: drawerIconColor,),
          ),
          ListTile(
            title: Text('Orders',
              style: drawerTextStyle,),
            leading: Icon(FontAwesomeIcons.shoppingBag,
              size: drawerIconSize,
              color: drawerIconColor,),
          ),
          ListTile(
            title: Text('Settings',
              style: drawerTextStyle,),
            leading: Icon(FontAwesomeIcons.cogs,
              size: drawerIconSize,
              color: drawerIconColor,),
          ),
        ],
      ),
    );
  }
}
