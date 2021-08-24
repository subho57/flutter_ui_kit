import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<FADeliveryCardModel> getDeliveryCard() {
  List<FADeliveryCardModel> mList = [];
  mList.add(FADeliveryCardModel(title: 'Express Delivery', price: '\u00243.99', estimateTime: 'Estimated time arrival'));
  mList.add(FADeliveryCardModel(title: 'Express Delivery', price: '\u00244.99', estimateTime: 'Estimated time arrival'));
  mList.add(FADeliveryCardModel(title: 'Express Delivery', price: '\u00245.99', estimateTime: 'Estimated time arrival'));
  mList.add(FADeliveryCardModel(title: 'Express Delivery', price: '\u00246.99', estimateTime: 'Estimated time arrival'));
  mList.add(FADeliveryCardModel(title: 'Express Delivery', price: '\u00248.99', estimateTime: 'Estimated time arrival'));
  return mList;
}

List<FASubscriptionModel> getSubscriptionList() {
  List<FASubscriptionModel> mList = [];
  mList.add(FASubscriptionModel(image: fa_hotstar, name: "Hotstar Premium", days: "Tomorrow", price: "\$ 16.4"));
  mList.add(FASubscriptionModel(image: fa_netflix, name: "Netflix Premium", days: "3 days remain", price: "\$ 10.4"));
  mList.add(FASubscriptionModel(image: fa_spotify, name: "Spotify Premium", days: "4 days remain", price: "\$ 19.4"));
  return mList;
}

List<FASummaryModel> getSummaryList() {
  List<FASummaryModel> mList = [];
  mList.add(FASummaryModel(image: fa_food, name: "Food", originalAmount: '\$720', discountAmount: '\$341'));
  mList.add(FASummaryModel(image: fa_drinks, name: "Drinks", originalAmount: '\$810', discountAmount: '\$240'));
  mList.add(FASummaryModel(image: fa_shopping, name: "Shopping", originalAmount: '\$721', discountAmount: '\$420'));
  return mList;
}

List<FASendAgainUserModel> getSendAgainUserList() {
  List<FASendAgainUserModel> mList = [];
  mList.add(FASendAgainUserModel(image: fa_user1, name: "Jerry"));
  mList.add(FASendAgainUserModel(image: fa_user2, name: "William"));
  mList.add(FASendAgainUserModel(image: fa_user3, name: "Lia"));
  mList.add(FASendAgainUserModel(image: fa_user4, name: "Emma"));
  mList.add(FASendAgainUserModel(image: fa_user5, name: "Isabella"));
  mList.add(FASendAgainUserModel(image: fa_user6, name: "Benjamin"));

  return mList;
}

List<FAContactModel> getContactList() {
  List<FAContactModel> mList = [];
  mList.add(FAContactModel(profile: fa_user2, name: "William", type: "@leocamp"));
  mList.add(FAContactModel(profile: fa_user4, name: "Emma", type: "@andrewpo"));
  mList.add(FAContactModel(profile: fa_user1, name: "Jerry", type: "@andrewpo"));
  mList.add(FAContactModel(profile: fa_user3, name: "Lia", type: "@leocamp"));
  return mList;
}

PyramidSeries<FAChartSampleData, String> getPyramidSeries() {
  final List<FAChartSampleData> pieData = <FAChartSampleData>[
    FAChartSampleData(x: 'Mar', y: 7.3),
    FAChartSampleData(x: 'Apr', y: 6.6),
    FAChartSampleData(x: 'May ', y: 3),
    FAChartSampleData(x: 'Jun', y: 0.8),
    FAChartSampleData(x: 'July ', y: 1.4),
    FAChartSampleData(x: 'Aug', y: 5.2),
    FAChartSampleData(x: 'Sep', y: 1.2),
    FAChartSampleData(x: 'Oct', y: 4.2),
    FAChartSampleData(x: 'Nov', y: 3.2),
    FAChartSampleData(x: 'Dec', y: 1.2),
  ];
  return PyramidSeries<FAChartSampleData, String>(
    dataSource: pieData,
    xValueMapper: (FAChartSampleData data, _) => data.x,
    yValueMapper: (FAChartSampleData data, _) => data.y,
    dataLabelSettings: DataLabelSettings(labelPosition: ChartDataLabelPosition.inside),
  );
}
