import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGCheckoutScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGDataProvider.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGMyCartScreen extends StatefulWidget {
  static String tag = '/EGMyCartScreen';

  @override
  EGMyCartScreenState createState() => EGMyCartScreenState();
}

class EGMyCartScreenState extends State<EGMyCartScreen> {
  double sum = 42;

  List<EGModel> myCartList() {
    List<EGModel> list = [];
    getPlants().forEach((element) {
      if (element.isCart) {
        list.add(element);
      }
    });
    return list;
  }

  List<EGModel> listOfCart;

  @override
  void initState() {
    super.initState();
    listOfCart = myCartList();
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
        appBar: appBarWidget("", elevation: 0, color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor),
        persistentFooterButtons: [
          Container(
            width: context.width(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal", style: primaryTextStyle(size: 18)),
                        Text("\$ $sum", style: primaryTextStyle(size: 18)),
                      ],
                    ),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping fee", style: secondaryTextStyle(size: 16)),
                        Text("\$ 1.0", style: secondaryTextStyle(size: 16)),
                      ],
                    ),
                    24.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: primaryTextStyle(size: 24)),
                        Text("\$ ${sum + 1}", style: primaryTextStyle(size: 24)),
                      ],
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        btnWithoutFillColor(btnText: "Add more").expand(),
                        16.width,
                        btnWithFillColor(btnText: "Checkout").onTap(() {
                          EGCheckoutScreen(totalPrice: sum).launch(context);
                        }).expand(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Cart", style: boldTextStyle(size: 32)),
              16.height,
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listOfCart.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(width: 100, height: 100, color: listOfCart[index].darkColor),
                            Positioned(bottom: 0, child: Container(width: 100, height: 30, color: listOfCart[index].lightColor.withOpacity(0.5))),
                            Image.asset(listOfCart[index].image, height: 80, width: 80),
                          ],
                        ).cornerRadiusWithClipRRect(defaultRadius),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(listOfCart[index].title, style: boldTextStyle(size: 20)).expand(),
                                IconButton(
                                  icon: Icon(AntDesign.delete, color: grey),
                                  iconSize: 18,
                                  onPressed: () {},
                                  visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                            4.height,
                            Text("It's spine is toxic", style: secondaryTextStyle(size: 14)),
                            12.height,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      iconSize: 20,
                                      icon: Icon(AntDesign.minussquareo, color: Colors.grey),
                                      onPressed: () {
                                        if (listOfCart[index].qty > 1) {
                                          listOfCart[index].qty--;
                                          sum = sum - listOfCart[index].price;
                                          setState(() {});
                                        }
                                      },
                                      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                      padding: EdgeInsets.zero,
                                    ),
                                    8.width,
                                    Text(listOfCart[index].qty.toStringAsFixed(0)),
                                    8.width,
                                    IconButton(
                                      iconSize: 20,
                                      icon: Icon(AntDesign.plussquareo, color: Colors.grey),
                                      onPressed: () {
                                        listOfCart[index].qty++;
                                        sum = sum + listOfCart[index].price;
                                        setState(() {});
                                      },
                                      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ).expand(),
                                Text("\$ ${listOfCart[index].price * listOfCart[index].qty}", style: boldTextStyle(color: egPrimaryColor1))
                              ],
                            ),
                          ],
                        ).expand()
                      ],
                    ).paddingAll(8),
                  );
                },
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
