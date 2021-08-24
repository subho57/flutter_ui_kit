import 'package:flutter/material.dart';

class CardDetails {
  final String cardNumber;
  final String cardImage;

  CardDetails({this.cardNumber, this.cardImage});
}

class User {
  final String name;
  final String avatarUrl;
  final int id;
  final int startingCost;

  User({this.name, this.avatarUrl, this.id, this.startingCost});
}

class HandymanData {
  final User user;
  final int starCount;
  final bool inHighDemand;
  final bool offerRemote;
  final bool isDiscount;
  final String address;
  final int numberReview;
  final String catName;

  HandymanData({this.user, this.starCount, this.inHighDemand, this.offerRemote, this.isDiscount, this.address, this.numberReview, this.catName});
}

class HandymanTaskData {
  final List<HandymanData> handymanData;
  final bool isRated;
  final int starCount;
  final int totalPrice;
  final String dateTime;

  HandymanTaskData({this.handymanData, this.isRated = true, this.starCount, this.totalPrice, this.dateTime});
}

class CategoryData {
  final String image;
  final String catName;
  final int startingPrice;
  final int endingPrice;

  CategoryData({this.image, this.catName, this.startingPrice, this.endingPrice});
}

class MainCategory {
  final String mainCat;
  final String imageData;

  MainCategory({this.mainCat, this.imageData});
}

class BookAppointmentQuestion {
  final String question;
  final List<ListOfOption> option;
  final bool isMultiChoice;
  final bool hasOption;

  BookAppointmentQuestion({this.question, this.option, this.isMultiChoice = false, this.hasOption = false});
}

class ListOfOption {
  final String listOption;
  final Icon icon;

  ListOfOption({this.listOption, this.icon});
}

class ChatModel {
  final User sender;
  final String text;

  ChatModel({this.text, this.sender});
}

class FilterData {
  final String filterName;
  final Widget checkBox;
  final isCheckBox;

  FilterData({this.filterName, this.checkBox, this.isCheckBox = true});
}
