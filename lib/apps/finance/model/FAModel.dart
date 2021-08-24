class FADeliveryCardModel {
  String title;
  String price;
  String estimateTime;

  FADeliveryCardModel({this.title, this.price, this.estimateTime});
}

class FASubscriptionModel {
  String image;
  String name;
  String days;
  String price;

  FASubscriptionModel({this.image, this.name, this.days, this.price});
}

class FASummaryModel {
  String image;
  String name;
  String spent;
  String originalAmount;
  String discountAmount;

  FASummaryModel({this.image, this.name, this.spent, this.originalAmount, this.discountAmount});
}

class FASendAgainUserModel {
  String name;
  String image;

  FASendAgainUserModel({this.name, this.image});
}

class FAContactModel {
  String profile;
  String name;
  String type;

  FAContactModel({this.profile, this.name, this.type});
}

class FASalesData {
  FASalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class FAChartSampleData {
  String x;
  double y;

  FAChartSampleData({this.x, this.y});
}
