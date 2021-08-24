import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHAuthenticationRoomComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHListYourSpaceScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHSearchScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHDashBoardScreen extends StatefulWidget {
  static String tag = '/RHDashBoardScreen';

  @override
  RHDashBoardScreenState createState() => RHDashBoardScreenState();
}

class RHDashBoardScreenState extends State<RHDashBoardScreen> {
  var roomController = TextEditingController();

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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 240.0,
              floating: false,
              pinned: false,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: innerBoxIsScrolled ? appPrimaryColor : Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  color: white,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(RH_home8, width: context.width(), height: 240, fit: BoxFit.fill).paddingBottom(25),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                        decoration: boxDecorationRoundedWithShadow(26, backgroundColor: white),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: appPrimaryColor),
                            5.width,
                            Text("LA", style: boldTextStyle(color: appPrimaryColor)),
                            5.width,
                            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                            5.width,
                            Container(width: 1, height: 28, color: Colors.grey[300]),
                            5.width,
                            AppTextField(
                              controller: roomController,
                              textFieldType: TextFieldType.NAME,
                              textAlign: TextAlign.start,
                              autoFocus: false,
                              onTap: () {
                                hideKeyboard(context);
                                RHSearchScreen().launch(context);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixStyle: TextStyle(color: Colors.white),
                                hintText: "Find district, street name",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ).expand(),
                          ],
                        ).paddingOnly(left: 8, right: 8),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  listWidget(RH_hurry_icon, "In a hurry", Colors.pink),
                  10.width,
                  listWidget(RH_nearby_icon, "Nearby", Colors.blueAccent),
                  10.width,
                  listWidget(RH_owner_site_icon, "No Owner \nonsite", Colors.greenAccent),
                  10.width,
                  listWidget(RH_list_your_space_icon, "List your \nspace", Colors.deepOrangeAccent).onTap(() {
                    RHListYourSpaceScreen().launch(context);
                  }),
                ],
              ).paddingOnly(left: 16, right: 16),
              30.height,
              Text("Search trends", style: boldTextStyle()),
              30.height,
              Container(
                width: context.width(),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(RH_city_img1, fit: BoxFit.fill, height: 260, width: 160),
                        ),
                        Text("California", style: boldTextStyle(color: white))
                      ],
                    ).expand(),
                    16.width,
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(RH_city_img2, fit: BoxFit.fill, height: 122, width: 200),
                            ),
                            Text("Overland Park", style: boldTextStyle(color: white))
                          ],
                        ),
                        16.height,
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(RH_city_img3, fit: BoxFit.fill, height: 122, width: 200),
                            ),
                            Text("Durham", style: boldTextStyle(color: white))
                          ],
                        ),
                      ],
                    ).expand()
                  ],
                ),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("The room is authenticated", style: boldTextStyle()),
                  Text("See more", style: boldTextStyle(size: 14, color: appPrimaryColor)),
                ],
              ),
              RHAuthenticationRoomComponent()
            ],
          ).paddingOnly(left: 16, right: 16, top: 20, bottom: 35),
        ),
      ),
    );
  }

  Widget listWidget(String image, String title, Color color) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(borderRadius: radius(16), backgroundColor: color),
          child: Image.asset(image, height: 24, width: 24),
        ),
        12.height,
        Text(title, style: secondaryTextStyle(size: 12), textAlign: TextAlign.center)
      ],
    );
  }
}
