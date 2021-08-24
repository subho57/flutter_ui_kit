import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGMyCartScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGStoreDetailsScreen extends StatefulWidget {
  static String tag = '/EGStoreDetailsScreen';
  final EGModel dataModel;

  const EGStoreDetailsScreen({Key key, this.dataModel}) : super(key: key);

  @override
  EGStoreDetailsScreenState createState() => EGStoreDetailsScreenState();
}

class EGStoreDetailsScreenState extends State<EGStoreDetailsScreen> {
  @override
  void initState() {
    super.initState();
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
        appBar: appBarWidget("", color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor, elevation: 0, actions: [
          IconButton(icon: Icon(Icons.local_grocery_store_outlined), color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark, onPressed: () {}),
        ]),
        persistentFooterButtons: [
          Container(
            width: context.width(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Price :", style: secondaryTextStyle(size: 16)),
                    8.width,
                    Text("\$ ${widget.dataModel.price}", style: primaryTextStyle(size: 20)),
                  ],
                ),
                btnWithFillColor(
                  btnText: "Add to cart",
                ).onTap(() {
                  EGMyCartScreen().launch(context);
                }),
              ],
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.dataModel.title, style: boldTextStyle(size: 32)),
              8.height,
              Text("Robust and dramatic,\nwith no leaves", style: secondaryTextStyle(size: 16)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Type", style: secondaryTextStyle()),
                      2.height,
                      Text("Indoor", style: boldTextStyle()),
                      16.height,
                      Text("Size", style: secondaryTextStyle()),
                      2.height,
                      Text("Small", style: boldTextStyle()),
                      16.height,
                      Text("Plants", style: secondaryTextStyle()),
                      2.height,
                      Text("Ferns", style: boldTextStyle()),
                    ],
                  ),
                  24.width,
                  commonCacheImageWidget(widget.dataModel.image, 200).expand(),
                ],
              ),
              32.height,
              Text("About", style: boldTextStyle(size: 20)),
              8.height,
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard text ever since the 1500s.",
                style: secondaryTextStyle(),
              ),
              32.height,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: EGPrimaryColor3, child: Icon(Icons.brightness_5, color: egPrimaryColor1, size: 18)),
                    12.width,
                    createRichText(list: [
                      TextSpan(text: "Sun\n", style: secondaryTextStyle()),
                      TextSpan(text: "8hrs", style: boldTextStyle()),
                    ]),
                    32.width,
                    CircleAvatar(backgroundColor: EGPrimaryColor3, child: Icon(MaterialCommunityIcons.water, color: egPrimaryColor1, size: 18)),
                    12.width,
                    createRichText(list: [
                      TextSpan(text: "Water\n", style: secondaryTextStyle()),
                      TextSpan(text: "2 days", style: boldTextStyle()),
                    ]),
                    32.width,
                    CircleAvatar(backgroundColor: EGPrimaryColor3, child: Icon(AntDesign.hearto, color: egPrimaryColor1, size: 18)),
                    12.width,
                    createRichText(list: [
                      TextSpan(text: "Lifetime\n", style: secondaryTextStyle()),
                      TextSpan(text: "7 months", style: boldTextStyle()),
                    ]),
                    32.width,
                    CircleAvatar(backgroundColor: EGPrimaryColor3, child: Icon(MaterialCommunityIcons.leaf, color: egPrimaryColor1, size: 18)),
                    12.width,
                    createRichText(list: [
                      TextSpan(text: "Sprouts\n", style: secondaryTextStyle()),
                      TextSpan(text: "7 days", style: boldTextStyle()),
                    ]),
                  ],
                ),
              ),
              16.height,
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
