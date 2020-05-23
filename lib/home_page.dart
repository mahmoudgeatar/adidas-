import 'package:flutter/material.dart';

import 'product.dart';
import 'productScreenBottomPart.dart';
import 'utilites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF696D77),
              Color(0xFF292C36),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: screenAwareSize(20.0, context),
              color: Colors.white,
            ),
          ),
          title: Text(
            'Energy Cloud',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareSize(18, context),
              fontFamily: "Montserrat-bold",
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              productionScreen(),
              ProductScreenBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
