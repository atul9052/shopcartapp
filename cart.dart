import 'package:flutter/material.dart';

class Cartitem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  Cartitem({this.id, this.name, this.quantity, this.price});
}

class Cart with ChangeNotifier {
  Map<String, Cartitem> _items = {};

  Map<String, Cartitem> get items {
    return {..._items};
  }

  int get itemcount {
    return _items.length;
  }

  void additem(String pdid, String name, double price) {
    if (_items.containsKey(pdid)) {
      _items.update(pdid, (existingcartitem) => Cartitem(
              id: DateTime.now().toString(),
              name: existingcartitem.name,
              quantity: existingcartitem.quantity + 1,
              price: existingcartitem.price));}
    else{
      _items.putIfAbsent(pdid, () => Cartitem(name: name,
      id: DateTime.now().toString(),quantity: 1,price: price ));
    }
    notifyListeners();
  }
void removeitem(String id){
    _items.remove(id);
    notifyListeners();
}
void removesingleitem(String id){
    if(!_items.containsKey(id)){
      return ;}
    if(_items[id].quantity>1){
      _items.update(id,(existingcartitem) => Cartitem(
          id: DateTime.now().toString(),
          name: existingcartitem.name,
          quantity: existingcartitem.quantity - 1,
          price: existingcartitem.price));
    }
    notifyListeners();
}
double get totalamount{
 var total = 0.0;
 _items.forEach((key, cartitem) {
   total+=cartitem.price*cartitem.quantity;
 });
 return total;
}
void clear(){
    _items = {};
    notifyListeners();

}
}
