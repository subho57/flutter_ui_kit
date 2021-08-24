import 'package:flutter/material.dart';

class FDHomeItemModel {
  String image;
  String name;

  FDHomeItemModel({this.image, this.name});
}

class FDPopularItemModel {
  String image;
  String name;
  int price;
  String description;
  bool isCart;
  bool isFavourite;
  int discount;
  int salePrice;
  int quantity;

  FDPopularItemModel({this.image, this.name, this.price, this.description, this.isCart, this.isFavourite, this.discount, this.salePrice, this.quantity});
}

class FDCollectionsItemModel {
  String image;
  String name;

  FDCollectionsItemModel({this.image, this.name});
}

class FDCategoriesItemModel {
  String image;
  String name;

  FDCategoriesItemModel({this.image, this.name});
}

class FDVoucherItemModel {
  String image;
  String voucherCode;
  var date;
  Color color;

  FDVoucherItemModel({this.image, this.voucherCode, this.date, this.color});
}

class FDAddressModel {
  String name;
  var contactNo;
  String addressName;
  String address;

  FDAddressModel({this.name, this.contactNo, this.addressName, this.address});
}

/*class FDFavouriteItemModel {
  String image;
  String name;
  int dollarPrice;
  bool isFavourite;

  FDFavouriteItemModel({this.image, this.name, this.dollarPrice, this.isFavourite});
}*/

class FDMyOrderHistoryItemModel {
  String image;
  String name;
  int dollarPrice;

  FDMyOrderHistoryItemModel({this.image, this.name, this.dollarPrice});
}

class FDMyOrderCommingItemModel {
  String image;
  String name;
  int dollarPrice;
  var time;
  int flag;

  FDMyOrderCommingItemModel({this.image, this.name, this.dollarPrice, this.time, this.flag});
}

/*
class FDMarketPopularItemModel {
  String image;
  String name;
  int dollarPrice;
  int salePrice;
  int discount;
  bool isFavourite;

  FDMarketPopularItemModel({this.image, this.name, this.dollarPrice, this.discount, this.isFavourite, this.salePrice});
}
*/

class FDFavouriteStoreItemModel {
  String image;
  String name;
  int discount;
  int branches;
  double rating;

  FDFavouriteStoreItemModel({this.image, this.name, this.discount, this.branches, this.rating});
}

class FDFavouriteStoreProductsModel {
  String image;
  String name;
  int price;
  String perPriceName;
  int flag;
  bool isCart;
  String details;
  int discount;
  bool isFavourite;
  int selectedQuantity;
  String quantityPerPrice;

  FDFavouriteStoreProductsModel({
    this.image,
    this.name,
    this.price,
    this.perPriceName,
    this.flag,
    this.details,
    this.discount,
    this.isCart,
    this.isFavourite,
    this.selectedQuantity,
    this.quantityPerPrice,
  });
}

class FDFavouriteStoreVoucherModel {
  String image;
  String description;
  String date;
  Color color;

  FDFavouriteStoreVoucherModel({this.image, this.description, this.date, this.color});
}

class FDShippingDetailsModel {
  String text;
  String time;
  Color color;

  FDShippingDetailsModel({this.text, this.time, this.color});
}

class FDPaymentCardModel {
  String cardNumber;
  String holderName;
  String expDate;

  FDPaymentCardModel({this.cardNumber, this.holderName, this.expDate});
}

class FDChatModel {
  final User sender;
  final String text;
  final String time;
  final String image;
  final String name;
  final int price;

  FDChatModel({this.sender, this.text, this.time, this.image, this.name, this.price});
}

class User {
  String name;
  int id;

  User({this.name, this.id});
}
