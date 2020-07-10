import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../model/product_list.dart';
import '../model/cart.dart';
class Detailpage extends StatelessWidget {
  static const routename = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context).settings.arguments as String;
    final loadedproduct =Provider.of<Products>(context).findbyID(productid);

    final cart =Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.name),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(loadedproduct.imgUrl),
                )),
          ),
Text("PRICE: ${loadedproduct.price}"),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(loadedproduct.description),
)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
      cart.additem(productid, loadedproduct.name, loadedproduct.price);
  },
      child: Icon(Icons.shopping_cart),
      ),
    );
  }


}
