import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homePage1/provider/quantity.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'provider/chooseSize.dart';
import 'utilites.dart';

class ProductScreenBottomPart extends StatefulWidget {
  @override
  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpand = false;
  void _expand() {
    setState(() {
      isExpand ? isExpand = false : isExpand = true;
    });
  }
  int currentColor = 1;

  List<Widget> colorSelector() {
    List<Widget> colorItemList = List();
    for (var i = 0; i < colors.length; i++) {
      colorItemList.add(colorItem(colors[i], i == currentColor, context, () {
        setState(() {
          currentColor = i;
        });
      }));
    }
    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18, context),
            ),
            child: Text(
              "Product Description",
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(12, context),
                fontFamily: "Montserrat-semiBold",
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: AnimatedCrossFade(
              duration: kThemeAnimationDuration,
              crossFadeState: isExpand
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(12, context),
                    fontFamily: "Montserrat-meduim"),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(12, context),
                    fontFamily: "Montserrat-meduim"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: GestureDetector(
              child: Text(
                isExpand ? "Less" : "More...",
                style: TextStyle(
                  color: Color(0xFFF8382F),
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: _expand,
            ),
          ),
          SizedBox(height: screenAwareSize(12, context)),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15, context),
                right: screenAwareSize(75, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(14, context),
                      fontFamily: 'Montserrat-semiBold'),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: screenAwareSize(14, context),
                      fontFamily: 'Montserrat-semiBold'),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20, context),
                right: screenAwareSize(10, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return Consumer<chooseSize>(
                          builder: (context, choose, widget) {
                        return GestureDetector(
                          onTap: () => choose.chooseC(index),
                          child: sizeItem(
                              item, index == choose.currentSizeIndex, context),
                        );
                      });
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: screenAwareSize(100, context),
                    height: screenAwareSize(30, context),
                    decoration: BoxDecoration(
                        color: Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: Consumer<Quantity>(
                              builder: (context, min, widget) {
                            return GestureDetector(
                              onTap: () => min.decrment(),
                              child: Container(
                                height: double.infinity,
                                child: Center(
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat-bold"),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Consumer<Quantity>(
                                builder:
                                    (BuildContext context, counter, widgit) {
                                  return Text(
                                    counter.counter.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat-bold"),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Consumer<Quantity>(
                            builder: (context, decrise, widget) {
                              return GestureDetector(
                                onTap: () => decrise.incerment(),
                                child: Container(
                                  height: double.infinity,
                                  child: Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Montserrat-bold"),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18, context)),
            child: Text(
              "Select Color",
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(12, context),
                fontFamily: "Montserrat-semiBold",
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Container(
            margin: EdgeInsets.only(left: screenAwareSize(20, context)),
            width: double.infinity,
            height: screenAwareSize(34, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(20, context),
            ),
            child: Text(
              'Price',
              style: TextStyle(
                color: Color(0xFF949598),
                fontFamily: 'Montserrat-semiBold',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(120, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: screenAwareSize(22, context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenAwareSize(18, context),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(26, context),
                                fontFamily: "Montserrat-semiBold",
                              ),
                            ),
                            SizedBox(
                              width: screenAwareSize(2, context),
                            ),
                            Text(
                              '80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(35, context),
                                fontFamily: 'Montserrat-semiBold',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(10, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14, context),
                          ),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenAwareSize(35, context)),
                              child: Text(
                                'Add To Cart',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(16, context),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -25,
                  child: Image.asset(
                    "assets/cart.png",
                    fit: BoxFit.cover,
                    width: screenAwareSize(180, context),
                    height: screenAwareSize(155, context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenAwareSize(20, context),
          ),
        ],
      ),
    );
  }

  Widget sizeItem(String size, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
            color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color:
                    isSelected ? Colors.black.withOpacity(.5) : Colors.black12,
                offset: Offset(0.0, 10.0),
                blurRadius: 10,
              )
            ]),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat-bold",
            ),
          ),
        ),
      ),
    );
  }

  divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      child: Container(
        width: 0.8,
        color: Colors.red,
      ),
    );
  }

  Widget colorItem(
      Color color, bool isSelected, BuildContext context, VoidCallback onTab) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenAwareSize(10, context),
        ),
        child: Container(
            width: screenAwareSize(30, context),
            height: screenAwareSize(30, context),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(.8),
                          offset: Offset(0.0, 10),
                          blurRadius: 10,
                        )
                      ]
                    : []),
            child: ClipPath(
              clipper: MCliper(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: color,
              ),
            )),
      ),
    );
  }
}

class MCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
