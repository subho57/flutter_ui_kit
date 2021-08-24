import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGDataProvider.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGMyOrdersScreen extends StatefulWidget {
  static String tag = '/EGMyOrdersScreen';

  @override
  EGMyOrdersScreenState createState() => EGMyOrdersScreenState();
}

class EGMyOrdersScreenState extends State<EGMyOrdersScreen> {
  List<Map<String, Object>> listOfVoucher = [
    {"percentage": "20% OFF", "forWhat": "To all plants & flowers", "date": "30 JAN 2020", "color": egPrimaryColor1},
    {"percentage": "50% OFF", "forWhat": "To all seeds & pots", "date": "30 MAR 2020", "color": EGSemanticColor2},
    {"percentage": "15% OFF", "forWhat": "To all seeds & pots", "date": "30 APR 2020", "color": EGSemanticColor1},
  ];

  List<EGOrderPackageModel> listOfOrder() {
    List<EGOrderPackageModel> list = [];
    getOrderPackages().forEach((element) {
      if (!element.isDetails) {
        list.add(element);
      }
    });
    return list;
  }

  List<EGOrderPackageModel> listOfDetails() {
    List<EGOrderPackageModel> list = [];
    getOrderPackages().forEach((element) {
      if (element.isDetails) {
        list.add(element);
      }
    });
    return list;
  }

  List<EGOrderPackageModel> listOfOrderDetails;
  List<EGOrderPackageModel> listOfOrderPreparingAndShipping;

  @override
  void initState() {
    super.initState();
    listOfOrderDetails = listOfDetails();
    listOfOrderPreparingAndShipping = listOfOrder();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                    elevation: 0,
                    title: Text("My Orders", style: boldTextStyle(size: 20)),
                    centerTitle: true,
                    backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegateDemo(
                    TabBar(
                      labelStyle: primaryTextStyle(size: 16),
                      labelColor: egPrimaryColor1,
                      isScrollable: true,
                      indicator: BoxDecoration(border: Border.symmetric()),
                      unselectedLabelColor: Colors.grey[350],
                      tabs: [Tab(text: "Ongoing"), Tab(text: "History"), Tab(text: "Voucher")],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                //Ongoing Tab
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: listOfOrderPreparingAndShipping.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: appStore.cardColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      commonCacheImageWidget(listOfOrderPreparingAndShipping[index].image, 30),
                                      16.width,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(listOfOrderPreparingAndShipping[index].packageName, style: boldTextStyle(size: 17)),
                                          Text(listOfOrderPreparingAndShipping[index].noOfItem.toString() + " items", style: secondaryTextStyle()),
                                        ],
                                      ).expand(),
                                      Row(children: [
                                        Text(
                                          listOfOrderPreparingAndShipping[index].isPreparing ? "Preparing" : "Shipping",
                                          style: primaryTextStyle(color: egPrimaryColor1),
                                        ),
                                        Icon(listOfOrderPreparingAndShipping[index].isSelect ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                                      ])
                                    ],
                                  ).onTap(() {
                                    listOfOrderPreparingAndShipping[index].isSelect = !listOfOrderPreparingAndShipping[index].isSelect;
                                    setState(() {});
                                  }),
                                  Theme(
                                    data: ThemeData(primarySwatch: primaryGardenColor),
                                    child: Stepper(
                                      physics: NeverScrollableScrollPhysics(),
                                      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                                        return Container();
                                      },
                                      steps: [
                                        Step(
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Receive Order", style: primaryTextStyle(size: 14, color: Colors.grey[400])),
                                                Text("6 Nov 2020", style: primaryTextStyle(size: 14, color: Colors.grey[400])),
                                              ],
                                            ),
                                            isActive: true,
                                            content: 0.width),
                                        Step(
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Preparing", style: listOfOrderPreparingAndShipping[index].isShipping ? primaryTextStyle(size: 14) : null),
                                                Text("6 Nov 2020", style: listOfOrderPreparingAndShipping[index].isShipping ? primaryTextStyle(size: 14) : null),
                                              ],
                                            ),
                                            isActive: listOfOrderPreparingAndShipping[index].isShipping ? true : false,
                                            content: 0.width),
                                        Step(
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [Text("Shipping", style: secondaryTextStyle()), Text("7 Nov 2020", style: secondaryTextStyle())],
                                            ),
                                            content: 0.width),
                                        Step(title: Text("Receive", style: secondaryTextStyle()), content: 0.width),
                                      ],
                                    ).visible(listOfOrderPreparingAndShipping[index].isSelect),
                                  )
                                ],
                              ).paddingAll(12),
                            ).paddingBottom(12);
                          })
                    ],
                  ).paddingAll(16),
                ),

                // History tab
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: listOfOrderDetails.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: appStore.cardColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      commonCacheImageWidget(listOfOrderDetails[index].image, 30),
                                      16.width,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(listOfOrderDetails[index].packageName, style: boldTextStyle(size: 17)),
                                          Text(listOfOrderDetails[index].noOfItem.toString() + " items", style: secondaryTextStyle(size: 14)),
                                        ],
                                      ).expand(),
                                      Row(children: [
                                        Text("Details", style: primaryTextStyle(color: egPrimaryColor1)),
                                        Icon(listOfOrderDetails[index].isSelect ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                                      ])
                                    ],
                                  ).onTap(() {
                                    listOfOrderDetails[index].isSelect = !listOfOrderDetails[index].isSelect;
                                    setState(() {});
                                  }),
                                  Column(
                                    children: [
                                      16.height,
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: listOfOrderDetails[index].noOfItem,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Container(width: 50, height: 50, color: Colors.purple[200]),
                                                    Positioned(
                                                      bottom: 0,
                                                      child: Container(width: 50, height: 20, color: Colors.purple[50].withOpacity(0.5)),
                                                    ),
                                                    Image.asset(EGImgPot05, height: 30, width: 30),
                                                  ],
                                                ).cornerRadiusWithClipRRect(defaultRadius),
                                                16.width,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Fruticosa", style: boldTextStyle(size: 16)).expand(),
                                                        Text("\$ 12.00", style: boldTextStyle(size: 16)),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Small, Indoor", style: secondaryTextStyle(size: 14, color: Colors.grey[400])).expand(),
                                                        Text("Qty: 1.0", style: secondaryTextStyle(size: 14, color: Colors.grey[400])),
                                                      ],
                                                    ),
                                                  ],
                                                ).expand()
                                              ],
                                            ).paddingBottom(8);
                                          }),
                                      8.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Subtotal", style: secondaryTextStyle(color: Colors.grey[400])),
                                          Text("\$ 117.00", style: secondaryTextStyle(color: Colors.grey[400])),
                                        ],
                                      ),
                                      10.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Charge", style: secondaryTextStyle(color: Colors.grey[400])),
                                          Text("\$ 0.00", style: secondaryTextStyle(color: Colors.grey[400])),
                                        ],
                                      ),
                                      10.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Shipping fee", style: secondaryTextStyle(color: Colors.grey[400])),
                                          Text("\$ 17.55", style: secondaryTextStyle(color: Colors.grey[400])),
                                        ],
                                      ),
                                      10.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Payment", style: secondaryTextStyle(color: Colors.grey[400])),
                                          Text("Visa Debit", style: secondaryTextStyle(color: Colors.grey[400])),
                                        ],
                                      ),
                                      10.height,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total", style: boldTextStyle()),
                                          Text("\$ 134.55", style: boldTextStyle()),
                                        ],
                                      ),
                                    ],
                                  ).visible(listOfOrderDetails[index].isSelect),
                                ],
                              ).paddingAll(12),
                            ).paddingBottom(12);
                          })
                    ],
                  ).paddingAll(16),
                ),

                //Voucher tab
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listOfVoucher.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 135,
                                decoration: boxDecorationWithRoundedCorners(
                                  backgroundColor: listOfVoucher[index]['color'],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listOfVoucher[index]['percentage'], style: boldTextStyle(size: 30, color: white)),
                                    8.height,
                                    Text(listOfVoucher[index]['forWhat'], style: boldTextStyle(size: 16, color: white))
                                  ],
                                ),
                              ).expand(flex: 3),
                              Container(
                                height: 135,
                                decoration: boxDecorationWithShadow(),
                                padding: EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    Text("Expiry:", style: primaryTextStyle(size: 14)),
                                    4.height,
                                    Text(listOfVoucher[index]['date'], style: boldTextStyle(size: 15)),
                                    8.height,
                                    Text(
                                      "Exclude seeds & fertilizer",
                                      style: secondaryTextStyle(size: 14, color: Colors.grey[400]),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ).expand(flex: 2)
                            ],
                          ).paddingBottom(24);
                        },
                      )
                    ],
                  ).paddingAll(16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
