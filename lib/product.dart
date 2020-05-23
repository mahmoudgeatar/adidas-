import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilites.dart';

class productionScreen extends StatefulWidget {
  @override
  _productionScreenState createState() => _productionScreenState();
}

class _productionScreenState extends State<productionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  child: Image.asset(
                "assets/adidas.png",
                width: double.infinity,
                height: double.infinity,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50, context),
                    height: screenAwareSize(50, context),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/360.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: screenAwareSize(18, context),
            bottom: screenAwareSize(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rating',
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(12, context),
                    fontFamily: "Montserrat-semiBold",
                  ),
                ),
                SizedBox(
                  height: screenAwareSize(8, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 8),
                    Icon(Icons.star, color: Color(0xFFFFe600)),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Text("4.5", style: TextStyle(color: Color(0xFFFFe600))),
                    SizedBox(width: screenAwareSize(5, context)),
                    Text(
                      "(378 People)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
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
