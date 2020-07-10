import 'package:flutter/material.dart';
import 'home_body.dart';
import 'package:shopcartapp/ui/cart_screen.dart';
class Shopapp extends StatefulWidget {
  @override
  _ShopappState createState() => _ShopappState();}
class _ShopappState extends State<Shopapp> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text("CART"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart,size: 30,), onPressed:() =>Navigator.of(context).pushNamed(cartscreen.routename) )
          ],
        ),
        body: Homebody(),
    );
  }
  /*_showdialog(BuildContext context) async {
    await showDialog(context: context,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Column(
            children: <Widget>[
              Text(" ADMIN LOGIN",style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.red

              ),),
              Expanded(child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(
                    labelText: "User name*",
                ),
                controller: nameinputcontroller,
              )),
              Expanded(child: TextField(
                autofocus: true,
                autocorrect: true,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "password*"
                ),
                controller: titleinputcontroller,
              )),

            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: () {
              nameinputcontroller.clear();
              titleinputcontroller.clear();

              Navigator.pop(context);
            }, child: Text("Cancel")),
            FlatButton(onPressed: () {
              if (titleinputcontroller.text.isNotEmpty &&
                  nameinputcontroller.text.isNotEmpty
                  ) {
                Firestore.instance.collection("cart")
                    .add({
                  "name": nameinputcontroller.text,
                  "title": titleinputcontroller.text,

                  "timestamp": new DateTime.now()
                }).then((response) {
                  print(response.documentID);
                  Navigator.pop(context);
                  nameinputcontroller.clear();
                  titleinputcontroller.clear();

                }).catchError((error) => print(error));
              }
            }, child: Text("Save")),
          ],
        ));
  }*/
}