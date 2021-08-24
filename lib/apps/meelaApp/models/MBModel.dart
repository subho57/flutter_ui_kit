import 'package:flutter/cupertino.dart';

class BudgetDetails {
  double percentage;
  String progressPercentage;
  String budgetType;
  String totalCost;
  String img;
  String date;
  IconData icon;
  String nameMonth;

  BudgetDetails({this.percentage, this.progressPercentage, this.budgetType, this.totalCost, this.icon, this.img, this.date, this.nameMonth});
}

class BHMessageModel {
  int senderId;
  int receiverId;
  String msg;
  String time;

  BHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
