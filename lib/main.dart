import 'package:flutter/material.dart';
import 'package:homePage1/provider/chooseSize.dart';
import 'package:homePage1/provider/quantity.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Quantity()),
        ChangeNotifierProvider(create: (_) => chooseSize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Adidas",
        home: HomePage(),
      ),
    );
  }
}
