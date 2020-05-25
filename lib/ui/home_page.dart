import 'package:flutter/material.dart';
import 'package:flutter_challenge/config/app_constants.dart';
import 'package:flutter_challenge/models/food_item.dart';
import 'package:flutter_challenge/ui/food_detail.dart';
import 'package:flutter_challenge/utils/food_repository.dart';
import 'package:flutter_challenge/utils/widget_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FoodItem> popularItems, topItems;
  double xOffset = 0;
  double yOffset = 0;
  bool isExpaned = false;

  @override
  void initState() {
    super.initState();
    popularItems = getpopularFood();
    topItems = getTopFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MyDrawer(),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform: Matrix4.translationValues(xOffset, yOffset, 0),
            curve: Curves.easeInOutCirc,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0)
              ),
              color: Color(0xFFAFE0E2),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD93E1A).withOpacity(0.5),
                  blurRadius: 16.0,
                  spreadRadius: 2.0
                )
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                verticalMarginMedium,
                buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        buildTitleWidget(),
                        verticalMargin(MARGIN_MEDIUM),
                        buildSearchBarWidget(),
                        verticalMargin(100.0),
                        Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            buildPopularFood(),
//                            buildTopFood(),
                            Positioned(
                              top: -80,
                              child: buildTopFood(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel,
            color: Colors.grey,),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on,
              color: Colors.grey,),
            title: Text('Location')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
              color: Colors.grey,),
            title: Text('Profile'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.orange,
      ),
    );
  }

  buildTitleWidget() {
    return Container(
      color: const Color(0xFFAFE0E2),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExactAssetImage('images/avatar.jpg'),
            minRadius: 24.0,
          ),
          horizontalMargin(MARGIN_MEDIUM),
          Text("How Hungry are You Today?",
              style: GoogleFonts.poppins(
                  fontSize: 18.0, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  buildSearchBarWidget() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: Container(
            height: 48.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                    color: Colors.grey,
                    size: 14.0,),
                  border: InputBorder.none,
                  hintText: "Search food items",
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0
                      )
                  )
              ),
            ),
          )),
          horizontalMargin(MARGIN_SMALL),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            width: 40.0,
            height: 48.0,
            child: Center(
              child: Icon(
                Icons.list,
                size: 16.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  buildPopularFood() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          verticalMargin(42.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Popular Foods',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                )
              ),),
              Text('View all',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFAFE0E2)
                    )
                ),)

            ],
          ),
          verticalMargin(40),
          Container(
            height: 240,
            child: ListView.builder(
                itemCount: popularItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=> FoodDetail()
                      ));
                    },
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          width: 220.0,
                          height: 200,
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  verticalMargin(40.0),
                                  Text(popularItems[index].foodName,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500
                                        )
                                      ),),
                                  verticalMargin(MARGIN_MEDIUM),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on,
                                      color: Colors.redAccent,),
                                      horizontalMargin(4.0),
                                      Text(popularItems[index].location,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0
                                        )
                                      ),)
                                    ],
                                  ),
                                  verticalMargin(MARGIN_MEDIUM),
                                  RatingBar(
                                    initialRating: popularItems[index].foodRating,
                                    itemSize: 16,
                                    glowColor: Colors.orange,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  verticalMargin(MARGIN_SMALL),
                                  Text('\$ ${popularItems[index].foodPrice}',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 18.0
                                    )
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40.0),
                              image: DecorationImage(image: ExactAssetImage(
                                popularItems[index].foodImage
                              )),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0
                                ),
                              ]
                            ),
                            child: CircleAvatar(
                              minRadius: 40.0,
                              backgroundImage: ExactAssetImage(
                                  popularItems[index].foodImage
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );

            }),
          )
        ],
      ),

    );
  }

  buildTopFood() {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: topItems.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=> FoodDetail()
                    ));
              },
              child: Container(
                width: 100,
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 2.0,
//                    spreadRadius: 2.0
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(topItems[index].foodImage,
                    width: 60,
                    height: 60,),
                    Text(topItems[index].foodName,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400
                      )
                    ),)
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  buildAppBar() {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(isExpaned){
            xOffset = 0;
            yOffset = 0;
            isExpaned = false;
          }else{
            xOffset = 200;
            yOffset = 100;
            isExpaned = true;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.clear_all,
              color: Colors.black.withOpacity(0.5),
            size: 28.0,)
          ],
        ),
      ),
    );
  }
}
