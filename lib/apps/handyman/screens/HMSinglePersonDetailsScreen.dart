import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMBookingAppointmentScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class HMSinglePersonDetailsScreen extends StatefulWidget {
  static String tag = '/HMSinglePersonDetailsScreen';
  final HandymanData handymanDetail;

  HMSinglePersonDetailsScreen({this.handymanDetail});

  @override
  HMSinglePersonDetailsScreenState createState() => HMSinglePersonDetailsScreenState();
}

class HMSinglePersonDetailsScreenState extends State<HMSinglePersonDetailsScreen> {
  var randomNumber = Random();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 230,
                    color: hmColorPrimary,
                    width: context.width(),
                    child: commonCacheImageWidget(hm_background1, 220, fit: BoxFit.cover),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 260,
                        width: context.width(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(widget.handymanDetail.catName, textAlign: TextAlign.center, style: boldTextStyle(size: 22)),
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar(
                                  itemSize: 26,
                                  ignoreGestures: true,
                                  initialRating: widget.handymanDetail.starCount.toDouble(),
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: (v) {},
                                ),
                                8.width,
                                Text("${widget.handymanDetail.numberReview} Reviews", style: boldTextStyle(color: HMFontColor400))
                              ],
                            ),
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, color: HMFontColor400),
                                Text("${widget.handymanDetail.address}", style: secondaryTextStyle()),
                              ],
                            ),
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(color: hmColorPrimary),
                                  child: Text("in High Demand", style: TextStyle(color: HMColorWhite)).paddingAll(8),
                                ).cornerRadiusWithClipRRect(HMCornerRadius),
                                4.width,
                                Container(
                                  decoration: BoxDecoration(color: hmColorPrimary),
                                  child: Text("Discount Available", style: TextStyle(color: HMColorWhite)).paddingAll(8),
                                ).cornerRadiusWithClipRRect(HMCornerRadius)
                              ],
                            ),
                          ],
                        ).paddingAll(HMAppPadding),
                        decoration: BoxDecoration(color: appStore.cardColor),
                      ).cornerRadiusWithClipRRect(HMCornerRadius),
                      16.height,
                      CommonSinglePersonDetail(
                        title: "About",
                        widgets: [
                          Text("I love what i do! Love the outdoors I'm always willing to go the extra mile to satisfy our customer. Call or message me for same day services.", style: secondaryTextStyle()),
                        ],
                      ),
                      16.height,
                      Container(
                        color: appStore.cardColor,
                        child: Row(
                          children: [
                            Text("You have Questions", style: boldTextStyle(size: 18)).expand(),
                            Container(
                              width: 45,
                              height: 45,
                              child: Icon(Icons.call, color: HMColorWhite),
                              decoration: BoxDecoration(color: Colors.greenAccent),
                            ).cornerRadiusWithClipRRect(16).paddingOnly(left: 8, right: 8),
                            Container(
                              width: 45,
                              height: 45,
                              child: Icon(
                                Icons.message_rounded,
                                color: HMColorWhite,
                              ),
                              decoration: BoxDecoration(color: hmColorPrimary),
                            ).cornerRadiusWithClipRRect(16).paddingOnly(left: 4, right: 4),
                          ],
                        ).paddingAll(8),
                      ).cornerRadiusWithClipRRect(HMCornerRadius),
                      16.height,
                      CommonSinglePersonDetail(title: "Overview", widgets: [
                        Row(children: [Icon(Icons.flash_on_rounded), 16.width, Text("Hired 50 Times", style: secondaryTextStyle())]),
                        4.height,
                        Row(children: [Icon(Icons.check_box_outlined), 16.width, Text("Background check", style: secondaryTextStyle())]),
                        4.height,
                        Row(children: [Icon(Icons.group), 16.width, Text("20 employees", style: secondaryTextStyle())]),
                        4.height,
                        Row(children: [Icon(Icons.date_range), 16.width, Text("8 Years in business", style: secondaryTextStyle())])
                      ]),
                      16.height,
                      CommonSinglePersonDetail(title: "Price Comparision", widgets: [
                        Text("Here's how the pro's price compare to the average cost in your area", style: secondaryTextStyle()),
                        8.height,
                        Text("Starting cost", style: boldTextStyle(size: 16)),
                        8.height,
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              child: commonCacheImageWidget(widget.handymanDetail.user.avatarUrl, 50, fit: BoxFit.cover),
                            ).cornerRadiusWithClipRRect(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("This Pro", style: boldTextStyle()),
                                8.height,
                                Stack(
                                  children: [
                                    Container(
                                      color: Colors.grey[300],
                                      width: (context.width() - 98) * 0.9,
                                      height: 25,
                                      child: Text("\$45", style: boldTextStyle(color: hmColorPrimary), textAlign: TextAlign.right).paddingAll(2),
                                    ).cornerRadiusWithClipRRect(8),
                                    Container(
                                      color: hmColorPrimary,
                                      width: (context.width() - 98) * 0.3,
                                      height: 25,
                                    ).cornerRadiusWithClipRRect(4)
                                  ],
                                )
                              ],
                            ).paddingAll(4)
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.grey[300]),
                              child: Icon(Icons.group, color: hmColorPrimary),
                            ).cornerRadiusWithClipRRect(16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Avg Pro", style: boldTextStyle()),
                                8.height,
                                Stack(
                                  children: [
                                    Container(
                                      color: Colors.grey[300],
                                      width: (context.width() - 98) * 0.9,
                                      height: 25,
                                      child: Text("\$82", style: boldTextStyle(color: hmColorPrimary), textAlign: TextAlign.right).paddingAll(2),
                                    ).cornerRadiusWithClipRRect(8),
                                    Container(color: hmColorPrimary, width: (context.width() - 98) * 0.5, height: 25).cornerRadiusWithClipRRect(4)
                                  ],
                                )
                              ],
                            ).paddingAll(4)
                          ],
                        )
                      ]),
                      16.height,
                      CommonSinglePersonDetail(
                        title: "Feature Project",
                        left: 0,
                        right: 0,
                        widgets: [
                          Container(
                            height: 210,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        child: commonCacheImageWidget(hm_background1, 150, width: 250, fit: BoxFit.cover),
                                      ).cornerRadiusWithClipRRect(HMCornerRadius),
                                      8.height,
                                      Text("The grass is Always Greener for Katies", style: boldTextStyle(), overflow: TextOverflow.ellipsis),
                                      4.height,
                                      Text("Approx - \$50", style: boldTextStyle(color: HMFontColor400)),
                                    ],
                                  ).paddingOnly(left: 8, right: 4),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      16.height,
                      CommonSinglePersonDetail(
                        title: "Photo and Video",
                        widgets: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,
                                child: commonCacheImageWidget(hm_homeGardaning1, 160, fit: BoxFit.cover),
                              ).cornerRadiusWithClipRRect(HMCornerRadius).expand(),
                              8.width,
                              Column(
                                children: [
                                  Container(
                                    width: 70,
                                    child: commonCacheImageWidget(hm_homeGardaning2, 70, fit: BoxFit.cover),
                                  ).cornerRadiusWithClipRRect(HMCornerRadius),
                                  16.height,
                                  Container(
                                    width: 70,
                                    child: commonCacheImageWidget(hm_homeGardaning3, 70, fit: BoxFit.cover),
                                  ).cornerRadiusWithClipRRect(HMCornerRadius)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      16.height,
                      CommonSinglePersonDetail(title: "Reviews and Ratings", widgets: [
                        Center(
                          child: Column(
                            children: [
                              RatingBar(
                                ignoreGestures: true,
                                initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (v) {},
                              ),
                              8.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${randomNumber.nextInt(5) + 0.8}', style: boldTextStyle(size: 22)),
                                  8.width,
                                  Text("93 review", style: boldTextStyle(color: HMFontColor400)),
                                ],
                              ),
                              16.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("5", style: boldTextStyle()),
                                  Icon(Icons.star, color: Colors.amber),
                                  8.width,
                                  Stack(children: [
                                    Container(color: Colors.white24, width: (context.width() - 98) * 0.6, height: 10).cornerRadiusWithClipRRect(8),
                                    Container(color: Colors.amber, width: (context.width() - 98) * 0.55, height: 10).cornerRadiusWithClipRRect(8)
                                  ]),
                                  8.width,
                                  Text("99%", style: boldTextStyle(color: HMFontColor400))
                                ],
                              ),
                              4.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("4", style: boldTextStyle()),
                                  Icon(Icons.star, color: Colors.amber),
                                  8.width,
                                  Container(color: Colors.white24, width: (context.width() - 98) * 0.6, height: 10).cornerRadiusWithClipRRect(8),
                                  8.width,
                                  Text("00%", style: boldTextStyle(color: HMFontColor400))
                                ],
                              ),
                              4.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("3", style: boldTextStyle()),
                                  Icon(Icons.star, color: Colors.amber),
                                  8.width,
                                  Stack(children: [
                                    Container(color: Colors.white24, width: (context.width() - 98) * 0.6, height: 10).cornerRadiusWithClipRRect(8),
                                    Container(color: Colors.amber, width: (context.width() - 98) * 0.05, height: 10).cornerRadiusWithClipRRect(8)
                                  ]),
                                  8.width,
                                  Text("01%", style: boldTextStyle(color: HMFontColor400))
                                ],
                              ),
                              4.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("2", style: boldTextStyle()),
                                  Icon(Icons.star, color: Colors.amber),
                                  8.width,
                                  Container(color: Colors.white24, width: (context.width() - 98) * 0.6, height: 10).cornerRadiusWithClipRRect(8),
                                  8.width,
                                  Text("00%", style: boldTextStyle(color: HMFontColor400))
                                ],
                              ),
                              4.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("1", style: boldTextStyle()),
                                  Icon(Icons.star, color: Colors.amber),
                                  8.width,
                                  Container(color: Colors.white24, width: (context.width() - 98) * 0.6, height: 10).cornerRadiusWithClipRRect(8),
                                  8.width,
                                  Text("00%", style: boldTextStyle(color: HMFontColor400))
                                ],
                              ),
                              8.height,
                              Divider(thickness: 1),
                              8.height,
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: commonCacheImageWidget(hm_person1, 80, fit: BoxFit.cover),
                                      ).cornerRadiusWithClipRRect(16),
                                      8.width,
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Georgie Johnston", style: boldTextStyle()),
                                          8.height,
                                          Text("Lawn Moving and Trimming", style: secondaryTextStyle()),
                                          8.height,
                                          RatingBar(
                                            itemSize: 18,
                                            initialRating: 5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                            onRatingUpdate: (v) {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  8.height,
                                  Text("What a great concept and value. I have wasted weeks trying interviewing.", style: boldTextStyle(size: 16))
                                ],
                              ),
                              Divider(thickness: 1),
                              8.height,
                              Column(
                                children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: commonCacheImageWidget(hm_person2, 80, fit: BoxFit.cover),
                                    ).cornerRadiusWithClipRRect(16),
                                    8.width,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Georgie Johnston", style: boldTextStyle()),
                                        4.height,
                                        Text("Lawn Moving and Trimming", style: secondaryTextStyle()),
                                        8.height,
                                        RatingBar(
                                          itemSize: 18,
                                          initialRating: 5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                          onRatingUpdate: (v) {},
                                        ),
                                      ],
                                    )
                                  ]),
                                  8.height,
                                  Text("What a great concept and value. I have wasted weeks trying interviewing.", style: boldTextStyle(size: 16))
                                ],
                              ),
                              Divider(thickness: 1),
                              8.height,
                              Column(
                                children: [
                                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      child: commonCacheImageWidget(hm_person3, 80, fit: BoxFit.cover),
                                    ).cornerRadiusWithClipRRect(16),
                                    8.width,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Georgie Johnston", style: boldTextStyle()),
                                        4.height,
                                        Text("Lawn Moving and Trimming", style: secondaryTextStyle()),
                                        8.height,
                                        RatingBar(
                                          itemSize: 18,
                                          initialRating: 5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                          onRatingUpdate: (v) {},
                                        ),
                                      ],
                                    )
                                  ]),
                                  8.height,
                                  Text("What a great concept and value. I have wasted weeks trying interviewing.", style: boldTextStyle(size: 16))
                                ],
                              )
                            ],
                          ),
                        ),
                      ])
                    ],
                  ).paddingOnly(left: HMAppPadding, right: HMAppPadding, bottom: HMAppPadding, top: 200),
                  Container(
                    width: context.width() / 3,
                    child: commonCacheImageWidget(widget.handymanDetail.user.avatarUrl, context.width() / 3, fit: BoxFit.cover),
                  ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 130, left: context.width() / 3),
                ],
              ),
            ).paddingBottom(70),
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(HMCornerRadius), color: hmColorPrimary),
                width: context.width(),
                child: Text("Booking Appointment", style: TextStyle(color: HMColorWhite, fontSize: HMFontSize)).center().paddingOnly(top: 16, bottom: 16),
              ).onTap(() {
                HMBookingAppointmentScreen().launch(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
