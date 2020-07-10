import 'package:flutter/cupertino.dart';
import 'package:shopcartapp/model/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class orderitem {
  final String id;
  final double amount;
  final List<Cartitem> products;
  final DateTime dateTime;

  orderitem({this.id, this.amount, this.products, this.dateTime});
}
class Orders with ChangeNotifier{
  List <orderitem> _orders =[];
  List <orderitem> get orders {
    return[..._orders];}
  Future<void>  addorder(List<Cartitem> cartproducts,double total) async {
    final url ='https://shopcart-53e0b.firebaseio.com/orders.json';
    final timestamp = DateTime.now();
    try{
      final response = await http.post(url,body: json.encode({
        'id': DateTime.now().toString(),
        'amount': total,
        'dateTime':timestamp.toIso8601String(),
        'products':cartproducts.map((cp) => {
          'id': cp.id,
          'title':cp.name,
          'quantity' :cp.quantity,
          'price':cp.price,


        }).toList(),
      }));
      _orders.insert(0, orderitem(
          id: json.decode(response.body)['name'],
          amount: total,
          dateTime: timestamp,
          products: cartproducts
      ));
      notifyListeners();
    }catch(err){
      throw err;
    }
  }
}

