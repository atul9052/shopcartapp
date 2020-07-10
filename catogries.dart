import 'package:flutter/material.dart';

import 'catogary_card.dart';
class Catogery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Catogerycard(Icon(Icons.book,size: 40,),'BOOK'),
          Catogerycard(Icon(Icons.computer,size: 40,),'LAPTOPS'),
          Catogerycard(Icon(Icons.videogame_asset,size: 40,),'GAMES'),
          Catogerycard(Icon(Icons.videocam,size: 40,),'MOVIES'),
          Catogerycard(Icon(Icons.watch,size: 40,),'WATCHES'),
          Catogerycard(Icon(Icons.weekend,size: 40,),'FURNITURE')
        ],
      ),
    );
  }
}
