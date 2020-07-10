import 'package:flutter/material.dart';
import 'package:shopcartapp/model/orders.dart';
import 'package:shopcartapp/model/product_list.dart';
import 'package:provider/provider.dart';
import 'package:shopcartapp/ui/login_page.dart';
import 'package:shopcartapp/ui/pdy_detail.dart';
import 'package:shopcartapp/ui/cart_screen.dart';
import 'model/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),

        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter E-commerce App',
        theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.white),
        home: Loginpage(),
        routes: {
          Detailpage.routename: (ctx) => Detailpage(),
          cartscreen.routename:(ctx) => cartscreen(),
        },

      ),
    );
  }
}