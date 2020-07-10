import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Userservices{
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref  ="users";
  createuser(Map value){
    _database.reference().child(ref).push().set(
      value
    ).catchError((e) => {print(e.toString())});
  }
}