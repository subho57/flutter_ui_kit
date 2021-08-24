import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMSinglePersonDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class HMHomeAll extends StatefulWidget {
  final List<HandymanData> handymanData;
  final List<User> user;

  HMHomeAll({this.handymanData, this.user});

  @override
  _HMHomeAllState createState() => _HMHomeAllState();
}

class _HMHomeAllState extends State<HMHomeAll> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (context, index) {
        HandymanData data = widget.handymanData[index % widget.handymanData.length];
        User user = data.user;
        return buildCommonDetails(context: context, data: data, index: index, user: user);
      },
    ).paddingBottom(16);
  }
}

class HMHomeRating extends StatefulWidget {
  final List<HandymanData> handymanData;
  final List<User> user;

  HMHomeRating({this.handymanData, this.user});

  @override
  _HMHomeRatingState createState() => _HMHomeRatingState();
}

class _HMHomeRatingState extends State<HMHomeRating> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        HandymanData data = widget.handymanData[index % widget.handymanData.length];
        User user = data.user;
        return buildCommonDetails(index: index, data: data, context: context, user: user);
      },
    ).paddingBottom(16);
  }
}

class HMHomeInHighDemand extends StatefulWidget {
  final List<HandymanData> handymanData;
  final List<User> user;

  HMHomeInHighDemand({this.handymanData, this.user});

  @override
  _HMHomeInHighDemandState createState() => _HMHomeInHighDemandState();
}

class _HMHomeInHighDemandState extends State<HMHomeInHighDemand> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        HandymanData data = widget.handymanData[index % widget.handymanData.length];
        User user = data.user;
        return buildCommonDetails(context: context, data: data, user: user, index: index);
      },
    ).paddingBottom(16);
  }
}

Widget buildCommonDetails({BuildContext context, HandymanData data, User user, int index, int starCount}) {
  return Container(
    decoration: BoxDecoration(color: appStore.cardColor),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          height: 80,
          child: commonCacheImageWidget(data.user.avatarUrl, 80, fit: BoxFit.cover),
        ).cornerRadiusWithClipRRect(HMCornerRadius),
        8.width,
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.catName, style: boldTextStyle(size: 16), overflow: TextOverflow.ellipsis),
              4.height,
              Row(
                children: [
                  RatingBar(
                    ignoreGestures: true,
                    itemSize: 16,
                    initialRating: data.starCount.toDouble(),
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (v) {},
                  ),
                  4.width,
                  Text("${data.numberReview} review", style: secondaryTextStyle())
                ],
              ),
              4.height,
              Row(
                children: [
                  Icon(Icons.location_on, color: HMFontColor400),
                  Text(
                    "${data.address}",
                    overflow: TextOverflow.ellipsis,
                    style: secondaryTextStyle(),
                  )
                ],
              ),
              4.height,
              Row(
                children: [
                  Text("\$${data.user.startingCost}", style: boldTextStyle(size: 16)),
                  4.width,
                  Text("Starting cost", style: secondaryTextStyle()),
                ],
              ),
              8.height,
              Wrap(
                spacing: 4,
                direction: Axis.vertical,
                children: [
                  if (data.inHighDemand)
                    Container(
                      decoration: BoxDecoration(color: hmColorPrimary),
                      child: FittedBox(child: Text("in High Demand", style: TextStyle(color: HMColorWhite)).paddingAll(8)),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                  if (data.isDiscount)
                    Container(
                      decoration: BoxDecoration(color: hmColorPrimary),
                      child: FittedBox(child: Text("Discount Available", style: TextStyle(color: HMColorWhite)).paddingAll(8)),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                  if (data.offerRemote)
                    Container(
                      decoration: BoxDecoration(color: hmColorPrimary),
                      child: FittedBox(child: Text("Offers Remote Available", style: TextStyle(color: HMColorWhite)).paddingAll(8)),
                    ).cornerRadiusWithClipRRect(HMCornerRadius)
                ],
              ),
            ],
          ),
        ).expand()
      ],
    ).paddingAll(HMAppPadding),
  ).cornerRadiusWithClipRRect(HMCornerRadius).paddingTop(16).onTap(
    () {
      HMSinglePersonDetailsScreen(handymanDetail: data).launch(context);
    },
  );
}
