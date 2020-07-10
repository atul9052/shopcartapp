import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcartapp/model/product_list.dart';
import 'package:shopcartapp/ui/pdy_detail.dart';
import 'package:shopcartapp/model/cart.dart';
class Pdtitem extends StatelessWidget {
  final String name;
  final String imageurl;

  Pdtitem({this.name, this.imageurl});
  @override
  Widget build(BuildContext context) {
    final pdt =  Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(Detailpage.routename,arguments:pdt.id );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(

            child:  Image.network(imageurl),
        footer: GridTileBar(
          title: Text(name),
          trailing: IconButton(icon:Icon(Icons.shopping_cart), onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 3),
                content: Text("Item added to cart"),
              ));
              cart.additem(pdt.id, pdt.name,pdt.price);}
              ),
          backgroundColor: Colors.black87,
        ),
        ),
      ),
    );
  }


}
