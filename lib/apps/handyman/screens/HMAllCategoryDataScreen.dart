import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/component/HMHomeComponent.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMAllCategoryData extends StatefulWidget {
  static String tag = '/HMSingleCategoryData';
  final HandymanData handymanData;
  final String appBarTitle;

  HMAllCategoryData({this.appBarTitle = "Recommended for you", this.handymanData});

  @override
  HMAllCategoryDataState createState() => HMAllCategoryDataState();
}

class HMAllCategoryDataState extends State<HMAllCategoryData> {
  int tabIndex = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context);
            },
          ),
          title: Text(widget.appBarTitle, style: boldTextStyle(size: HMScreenHeadingFontSize.toInt())),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list_rounded, color: hmColorPrimary),
              onPressed: () {
                _openFilterBottomSheet();
                hideKeyboard(context);
              },
            ),
          ],
          elevation: 0,
          bottom: PreferredSize(
            child: Container(
              color: appStore.cardColor,
              height: 60,
              width: context.width(),
              child: ListView(
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: tabIndex == 1 ? hmColorPrimary : Colors.grey[200]),
                        child: Text(
                          "All",
                          style: boldTextStyle(color: tabIndex == 1 ? HMColorWhite : Colors.black),
                        ).paddingOnly(top: 16, bottom: 16, left: 32, right: 32),
                      ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(
                        () {
                          tabIndex = 1;
                          setState(() {});
                        },
                      ),
                      16.width,
                      Container(
                        decoration: BoxDecoration(color: tabIndex == 2 ? hmColorPrimary : Colors.grey[200]),
                        child: Text("Ratings", style: boldTextStyle(color: tabIndex == 2 ? HMColorWhite : Colors.black)).paddingAll(16),
                      ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(
                        () {
                          tabIndex = 2;
                          setState(() {});
                        },
                      ),
                      16.width,
                      Container(
                        decoration: BoxDecoration(color: tabIndex == 3 ? hmColorPrimary : Colors.grey[200]),
                        child: Text("in High Demand", style: boldTextStyle(color: tabIndex == 3 ? HMColorWhite : Colors.black)).paddingAll(16),
                      ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(
                        () {
                          tabIndex = 3;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ).paddingOnly(bottom: 16),
            preferredSize: Size.fromHeight(70),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                child: TextField(
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: hmColorPrimary),
                    hintText: "Searching...",
                    hintStyle: secondaryTextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ).cornerRadiusWithClipRRect(HMCornerRadius).paddingAll(HMAppPadding),
              SingleChildScrollView(
                child: tabIndex == 1
                    ? HMHomeAll(handymanData: handymanDataList, user: fav)
                    : tabIndex == 2
                        ? HMHomeRating(handymanData: ratingWiseList, user: fav)
                        : tabIndex == 3
                            ? HMHomeInHighDemand(handymanData: inHighDemandList, user: fav)
                            : null,
              ).paddingOnly(left: 16, right: 16).expand(),
            ],
          ),
        ),
      ),
    );
  }

  _openFilterBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: DraggableScrollableSheet(
            initialChildSize: 1.0,
            minChildSize: 0.95,
            builder: (context, scrollControl) {
              return SingleChildScrollView(
                controller: scrollControl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(color: Colors.grey, width: 50, height: 5).cornerRadiusWithClipRRect(8),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reset", style: boldTextStyle()),
                        Text("Filters", style: boldTextStyle(size: 32)).paddingTop(16),
                        Text("Cancel", style: boldTextStyle()).onTap(() {
                          finish(context);
                        })
                      ],
                    ),
                    Divider(thickness: 1),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filterData.length,
                      itemBuilder: (context, index) {
                        FilterData data = filterData[index];
                        return Container(
                          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
                          child: Column(
                            children: [
                              data.isCheckBox
                                  ? Row(children: [Text("${data.filterName}", style: secondaryTextStyle()).expand(), data.checkBox])
                                  : Text(
                                      "${data.filterName}",
                                      style: secondaryTextStyle(size: 22),
                                    ),
                            ],
                          ),
                        );
                      },
                    ),
                    16.height,
                    CommonButton("Apply").onTap(() {
                      finish(context);
                    })
                  ],
                ).paddingAll(HMAppPadding),
              );
            },
          ),
        );
      },
    );
  }
}
