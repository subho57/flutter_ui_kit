import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class CommonButton extends StatelessWidget {
  final String buttonName;

  CommonButton(
    this.buttonName,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: hmColorPrimary),
      width: context.width(),
      child: Text(buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HMColorWhite,
            fontSize: HMFontSize,
          )).center().paddingOnly(top: 16, bottom: 16),
    ).cornerRadiusWithClipRRect(HMCornerRadius);
  }
}

class CommonCardDetail extends StatelessWidget {
  final String cardImage;
  final String cardNumber;
  final bool isBorder;
  final int selectedIndex;
  final int mainIndex;

  CommonCardDetail({@required this.cardNumber, @required this.cardImage, this.isBorder = false, this.selectedIndex, this.mainIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      decoration: BoxDecoration(
        color: selectedIndex == mainIndex ? hmColorPrimary : appStore.cardColor,
        borderRadius: BorderRadius.circular(HMCornerRadius),
        border: isBorder ? Border.all(color: HMFontColor400) : null,
      ),
      child: Row(
        children: [
          Image.asset(cardImage, height: 50, width: 50),
          8.width,
          Text(cardNumber, style: boldTextStyle(size: 16)).expand(),
          Icon(Icons.arrow_forward_ios, size: 14, color: HMFontColor400),
        ],
      ).paddingOnly(top: 4, bottom: 4, left: 8, right: 8),
    ).paddingTop(16);
  }
}

class CommonCategoryContainer extends StatefulWidget {
  final List<CategoryData> recommendedList;

  CommonCategoryContainer({@required this.recommendedList});

  @override
  _CommonCategoryContainerState createState() => _CommonCategoryContainerState();
}

class _CommonCategoryContainerState extends State<CommonCategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, right: 8),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.recommendedList.length,
        itemBuilder: (context, index) {
          CategoryData data = widget.recommendedList[index];
          return Container(
            decoration: BoxDecoration(color: appStore.cardColor),
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(data.image, 150, width: 160, fit: BoxFit.cover),
                8.height,
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(data.catName, style: boldTextStyle(), overflow: TextOverflow.ellipsis), 4.height, Text("\$${data.startingPrice} - \$${data.endingPrice}", style: boldTextStyle(color: HMFontColor400))],
                  ),
                ).paddingLeft(8),
              ],
            ),
          ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(left: 8, right: 8);
        },
      ),
    );
  }
}

class CommonSubCategoryContainer extends StatefulWidget {
  final List<CategoryData> categoryData;

  CommonSubCategoryContainer({@required this.categoryData});

  @override
  _CommonSubCategoryContainerState createState() => _CommonSubCategoryContainerState();
}

class _CommonSubCategoryContainerState extends State<CommonSubCategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 8, right: 8),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.categoryData.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: appStore.cardColor),
              width: 160,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonCacheImageWidget(widget.categoryData[index].image, 100, width: 160, fit: BoxFit.cover),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [Text(widget.categoryData[index].catName, style: boldTextStyle(size: 16), overflow: TextOverflow.ellipsis)],
                        ),
                        4.height,
                        Text(
                          "\$${widget.categoryData[index].startingPrice} - \$${widget.categoryData[index].endingPrice}",
                          style: boldTextStyle(size: 14, color: HMFontColor400),
                        )
                      ],
                    ),
                  ).paddingOnly(left: 4, top: 4),
                ],
              ),
            ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(left: 8, right: 8);
          }),
    );
  }
}

// ignore: must_be_immutable
class CommonCheckBox extends StatefulWidget {
  static String tag = '/CommonCheckBox';

  bool isCheck;

  CommonCheckBox({this.isCheck = false});

  @override
  CommonCheckBoxState createState() => CommonCheckBoxState();
}

class CommonCheckBoxState extends State<CommonCheckBox> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
      ),
      child: Checkbox(
          value: widget.isCheck,
          onChanged: (value) {
            widget.isCheck = value;
            setState(() {});
          }),
    );
  }
}

class CommonSinglePersonDetail extends StatelessWidget {
  final String title;
  final List<Widget> widgets;

  final double top;
  final double bottom;
  final double left;
  final double right;

  CommonSinglePersonDetail({@required this.title, @required this.widgets, this.top = 8, this.bottom = 8, this.left = 8, this.right = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appStore.cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: boldTextStyle(size: 22)).paddingOnly(left: 8, top: 8, bottom: 8),
          Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets).paddingOnly(left: left, top: top, bottom: bottom, right: right)
        ],
      ),
    ).cornerRadiusWithClipRRect(HMCornerRadius);
  }
}

class CommonOptionData extends StatelessWidget {
  final String optionData;
  final int selectedIndex;
  final int mainIndex;
  final Icon icon;

  CommonOptionData({this.optionData, this.selectedIndex, this.mainIndex, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: appStore.cardColor, borderRadius: BorderRadius.circular(HMCornerRadius), border: selectedIndex == mainIndex ? Border.all(color: hmColorPrimary, width: 2) : null),
      width: context.width() * 0.7,
      height: 60,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, 8.width, Text(optionData, style: boldTextStyle(size: 16), overflow: TextOverflow.ellipsis)],
            )
          : Text(optionData, style: boldTextStyle(size: 16), overflow: TextOverflow.ellipsis).center(),
    );
  }
}
