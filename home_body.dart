import 'package:flutter/material.dart';
import 'package:shopcartapp/widgets/catogries.dart';
import 'package:shopcartapp/widgets/products.dart';
class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Center(
          child: Text("Catogries",style: TextStyle(fontSize: 40),
          ),
        ),
        SizedBox(height: 10,),
        Catogery(),
        Center(child: Text("Products",style: TextStyle(fontSize: 40),)),
        Productslist()
      ],
    );
  }
}
