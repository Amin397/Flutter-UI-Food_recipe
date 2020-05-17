import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                color: Colors.grey.withOpacity(0.12),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 10.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                              size: 30.0,
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'Search for Recipes and Channels',
                            hintStyle: TextStyle(color: Colors.black26)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: Colors.orangeAccent,
                                      width: 3.0,
                                      style: BorderStyle.solid))),
                          child: Center(
                            child: Text(
                              'POPULAR RECIPES \nTHIS WEEK',
                              style: TextStyle(
                                fontFamily: 'Timesroman',
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    height: 120.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _itemBuilder(
                            "assets/images/balanced.jpg", "Amin Khademi"),
                        _itemBuilder("assets/images/food.jpg", "Shadi Khademi"),
                        _itemBuilder(
                            "assets/images/pasta.jpg", "Nader Khademi"),
                        _itemBuilder("assets/images/food.jpg", "Shadi Khademi"),
                        _itemBuilder("assets/images/food.jpg", "Shadi Khademi"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'September 7',
              style: TextStyle(
                  fontSize: 14.0, color: Colors.grey, fontFamily: "Quicksand"
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'TODAY',
              style: TextStyle(
                  fontSize: 30.0,fontWeight: FontWeight.bold, fontFamily: "Timesroman"
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  height: 290.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/breakfast.jpg")
                      )
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 150.0, left: 280.0),
                  child: Column(
                    children: <Widget>[
                      Text('BEST OF',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('THE DAY',
                        style: TextStyle(
                            fontFamily: 'Timesroman',
                            fontSize: 25.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 3.0,
                        width: 50.0,
                        color: Colors.orange,
                      )
                    ],
                  )
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(String imagePath, String title) {
    return Container(
      height: 125.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      width: 250.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imagePath))),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 125.0,
            width: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Grilled Chicken \nwith fruit salad',
                  style: TextStyle(fontFamily: "Quicksand"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 2.0,
                  width: 80,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/chris.jpg"))),
                    ),
                    Text(title, style: TextStyle(fontFamily: "Quicksand"))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
