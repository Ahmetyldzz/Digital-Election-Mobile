import 'package:flutter/material.dart';
class CustomCardModel {
  Icon? userIcon;
  String? title;
  ElevatedButton? elevatedButton;
  

  CustomCardModel({this.userIcon, this.elevatedButton, this.title});

  CustomCardModel.fromJson(Map<String, dynamic> json) {
    userIcon = json['userId'];
    elevatedButton = json['id'];
    title = json['title'];
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userIcon;
    data['id'] = this.elevatedButton;
    data['title'] = this.title;
    
    return data;
  }
}
