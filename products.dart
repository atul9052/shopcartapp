import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcartapp/model/product_list.dart';
import 'package:shopcartapp/widgets/prdt_item.dart';
class Productslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Products>(context);
    final pdts = productdata.items;


    return GridView.builder(
physics: ScrollPhysics(),
shrinkWrap: true,
itemCount: pdts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (ctx,i) => ChangeNotifierProvider.value(value: pdts[i],
      child: Pdtitem(name:pdts[i].name,imageurl: pdts[i].imgUrl)),
    );
  }
}
