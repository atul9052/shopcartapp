import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcartapp/model/cart.dart';
import 'package:shopcartapp/model/orders.dart';
import 'package:shopcartapp/widgets/cartitems.dart';
class cartscreen extends StatelessWidget {
  static const  routename = "/cart";
  @override
  Widget build(BuildContext context) {

    final cart =Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Theme.of(context).accentColor
        ),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
                itemBuilder: (ctx,i)=>Cartitems(
                  cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name
                )
            ),
          ),
        checkout(cart: cart)
        ],
      ),
    );
  }
}
class checkout extends StatefulWidget {
  final Cart cart;
  const checkout({this.cart});
  @override
  _checkoutState createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: widget.cart.totalamount<=0?null:() async{
      await Provider.of<Orders>(context,listen: false).addorder(widget.cart.items.values.toList(),
      widget.cart.totalamount);
    }, child: Text("Checkout"));
  }
}









