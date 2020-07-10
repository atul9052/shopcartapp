import 'package:flutter/material.dart';
class Catogerycard extends StatelessWidget {
  final Icon icon;
  final String name;

  Catogerycard(this.icon, this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.blueGrey
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              icon,
              SizedBox(height: 10,),
              Text(name)
            ],
          ),
        ),
      ),
    );
  }

}
