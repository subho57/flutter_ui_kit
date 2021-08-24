import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHRoommatesDetailsScreen extends StatefulWidget {
  static String tag = '/RHRoommatesDetailsScreen';
  final RoommateModel roomMatesData;

  RHRoommatesDetailsScreen({this.roomMatesData});

  @override
  RHRoommatesDetailsScreenState createState() => RHRoommatesDetailsScreenState();
}

class RHRoommatesDetailsScreenState extends State<RHRoommatesDetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            finish(context);
          },
        ),
        centerTitle: true,
        title: Text("Roommate", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.roomMatesData.img.validate(), width: context.width(), height: 260, fit: BoxFit.cover),
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.roomMatesData.name.validate(), style: boldTextStyle(size: 24)),
                30.height,
                roommatesDetailsWidget(RH_pricetag_icon, "Price range", "222 USD - 172 USD"),
                30.height,
                roommatesDetailsWidget(RH_location_icon, "Searching location", "Montana"),
                30.height,
                roommatesDetailsWidget(RH_search_icon, "Look for", widget.roomMatesData.gender),
                80.height,
                AppButton(
                  color: appPrimaryColor,
                  width: context.width(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat, color: white),
                      8.width,
                      Text('Chat', style: boldTextStyle(size: 14, color: white)),
                    ],
                  ),
                  onTap: () {
                    finish(context);
                  },
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
                ),
              ],
            ).paddingAll(16)
          ],
        ),
      ),
    );
  }

  Widget roommatesDetailsWidget(String icon, String title, String dec) {
    return Row(
      children: [
        Image.asset(icon, height: 20, width: 20, color: Colors.grey),
        8.width,
        Text(title, style: boldTextStyle()).expand(),
        Text(dec, style: secondaryTextStyle()),
      ],
    );
  }
}
