import 'package:flutter/material.dart';

class EGModel {
  String title;
  String subtitle;
  String image;
  double price;
  String type;
  double qty;
  Color darkColor;
  Color lightColor;
  Color textColor;
  bool isCart;

  EGModel({this.title, this.qty = 1, this.subtitle, this.image, this.price, this.type, this.darkColor, this.lightColor, this.textColor, this.isCart = false});
}

class EGLanguageModel {
  String language;
  String image;
  bool isSelect;

  EGLanguageModel({this.language, this.image, this.isSelect = false});
}

class EGOrderPackageModel {
  String packageName;
  int noOfItem;
  bool isPreparing;
  bool isShipping;
  bool isDetails;
  bool isSelect;
  String image;

  EGOrderPackageModel({
    this.packageName,
    this.noOfItem,
    this.isPreparing = false,
    this.isShipping = false,
    this.isDetails = false,
    this.isSelect = false,
    this.image,
  });
}
