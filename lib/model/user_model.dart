import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {

  static const NUMBER = 'number';
  static const ID = 'id';

  late String _number, _id;

  String get number => _number;
  String get id => _id;
  
  UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot){
    _number = snapshot.data()![NUMBER];
    _id = snapshot.data()![ID];
  }
}