import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMRatingScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMSinglePersonDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class HMTaskOngoing extends StatefulWidget {
  final List<CategoryData> catData;

  HMTaskOngoing({this.catData});

  @override
  _HMTaskOngoingState createState() => _HMTaskOngoingState();
}

class _HMTaskOngoingState extends State<HMTaskOngoing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 140,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 8, right: 8),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.catData.length,
              itemBuilder: (context, index) {
                CategoryData data = widget.catData[index];
                return Container(
                  width: 200,
                  decoration: BoxDecoration(color: appStore.cardColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCacheImageWidget(data.image, 100, width: 200, fit: BoxFit.cover),
                      Text(
                        data.catName,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(),
                      ).paddingAll(8)
                    ],
                  ),
                ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(left: 8, right: 8);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(color: appStore.cardColor),
            child: Column(children: [
              Row(
                children: [
                  Container(child: commonCacheImageWidget(hm_person2, 80, width: 80, fit: BoxFit.cover)).cornerRadiusWithClipRRect(HMCornerRadius),
                  16.width,
                  Text("Full Service Lawn Care", style: boldTextStyle(size: 18))
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Time", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                  Text("04:30PM,Aug 14 2020", style: boldTextStyle(color: hmColorPrimary)),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Places", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                  Text("Commercial", style: boldTextStyle()),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Type", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                  Text("Large(5,000-10,000 sq ft)", style: boldTextStyle()),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Status Lawn", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                  Text("Once a week", style: boldTextStyle()),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Options", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                  Text("Moving, trimming & edging\nFertilizing and overseeding", style: boldTextStyle()),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Total Price", style: primaryTextStyle(size: 18)).expand(),
                  Text("\$325", style: boldTextStyle(color: hmColorPrimary)),
                ],
              ),
              Divider(thickness: 1, height: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              Row(
                children: [
                  Text("Status", style: primaryTextStyle(size: 18)).expand(),
                  Text("Waiting Accept", style: boldTextStyle(color: Colors.red)),
                ],
              )
            ]).paddingAll(16),
          ).cornerRadiusWithClipRRect(HMCornerRadius).paddingAll(HMAppPadding)
        ],
      ),
    );
  }
}

class HMTaskCompleted extends StatefulWidget {
  final List<HandymanTaskData> taskData;

  HMTaskCompleted({this.taskData});

  @override
  _HMTaskCompletedState createState() => _HMTaskCompletedState();
}

class _HMTaskCompletedState extends State<HMTaskCompleted> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.taskData.length,
        itemBuilder: (context, index) {
          HandymanTaskData data = widget.taskData[index];
          return Container(
            decoration: BoxDecoration(color: appStore.cardColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  child: commonCacheImageWidget(data.handymanData[index].user.avatarUrl, 80, fit: BoxFit.cover),
                ).cornerRadiusWithClipRRect(HMCornerRadius),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.handymanData[index].catName, style: boldTextStyle()),
                      8.height,
                      Row(
                        children: [
                          Text("Your review", style: boldTextStyle(color: HMFontColor400), overflow: TextOverflow.ellipsis).expand(),
                          data.isRated
                              ? RatingBar(
                                  ignoreGestures: true,
                                  itemSize: 16,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: (v) {},
                                )
                              : Container(),
                        ],
                      ),
                      8.height,
                      Row(
                        children: [
                          Text("Total Price", style: boldTextStyle(color: HMFontColor400), overflow: TextOverflow.ellipsis).expand(),
                          Text("\$${data.totalPrice}", style: boldTextStyle(color: hmColorPrimary)),
                        ],
                      ),
                      8.height,
                      Row(
                        children: [
                          Text("DateTime", style: boldTextStyle(color: HMFontColor400), overflow: TextOverflow.ellipsis).expand(),
                          Text("${data.dateTime}", style: boldTextStyle()),
                        ],
                      ),
                      4.height,
                      Wrap(
                        runSpacing: 8,
                        spacing: 8,
                        children: [
                          data.isRated
                              ? Container()
                              : Container(
                                  decoration: BoxDecoration(color: hmColorPrimary),
                                  child: FittedBox(
                                    child: Text("Rating", style: boldTextStyle(color: HMColorWhite)).paddingOnly(top: 8, bottom: 8, left: 32, right: 32),
                                  ),
                                ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(() {
                                  HMRatingScreen().launch(context);
                                }),
                          Container(
                            decoration: BoxDecoration(color: hmColorPrimary),
                            child: FittedBox(
                              child: Text("Re-booking", style: boldTextStyle(color: HMColorWhite)).paddingOnly(top: 8, bottom: 8, left: 32, right: 32),
                            ),
                          ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(() {
                            HMSinglePersonDetailsScreen(handymanDetail: data.handymanData[index]).launch(context);
                          })
                        ],
                      ),
                    ],
                  ),
                ).paddingOnly(left: 8).expand()
              ],
            ).paddingAll(HMAppPadding),
          ).cornerRadiusWithClipRRect(HMCornerRadius).paddingAll(HMCornerRadius);
        });
  }
}

class HMTaskArchived extends StatefulWidget {
  final List<HandymanTaskData> taskData;

  HMTaskArchived({this.taskData});

  @override
  _HMTaskArchivedState createState() => _HMTaskArchivedState();
}

class _HMTaskArchivedState extends State<HMTaskArchived> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.taskData.length,
      itemBuilder: (context, index) {
        HandymanTaskData data = widget.taskData[index];
        return Container(
          decoration: BoxDecoration(color: appStore.cardColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                child: commonCacheImageWidget(data.handymanData[index].user.avatarUrl, 80, fit: BoxFit.cover),
              ).cornerRadiusWithClipRRect(HMCornerRadius),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${data.handymanData[index].catName}", style: boldTextStyle()),
                    8.height,
                    Row(
                      children: [
                        Text("Total Price", style: boldTextStyle(color: HMFontColor400), overflow: TextOverflow.ellipsis).expand(),
                        Text("\$${data.totalPrice}", style: boldTextStyle(color: hmColorPrimary)),
                      ],
                    ),
                    8.height,
                    Row(
                      children: [
                        Text("DateTime", style: boldTextStyle(color: HMFontColor400), overflow: TextOverflow.ellipsis).expand(),
                        Text("${data.dateTime}", style: boldTextStyle()),
                      ],
                    ),
                    8.height,
                    Container(
                      decoration: BoxDecoration(color: hmColorPrimary),
                      child: FittedBox(
                        child: Text("Re-booking", style: boldTextStyle(color: HMColorWhite)).paddingOnly(top: 8, bottom: 8, left: 32, right: 32),
                      ),
                    ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(() {
                      HMSinglePersonDetailsScreen(handymanDetail: data.handymanData[index]).launch(context);
                    }),
                  ],
                ),
              ).paddingOnly(left: 8).expand()
            ],
          ).paddingAll(HMAppPadding),
        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingAll(HMCornerRadius);
      },
    );
  }
}
