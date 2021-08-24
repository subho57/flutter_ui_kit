import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHRoomFilterScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHRoommatesDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHRoommatesScreen extends StatefulWidget {
  static String tag = '/RHRoommatesScreen';

  @override
  RHRoommatesScreenState createState() => RHRoommatesScreenState();
}

class RHRoommatesScreenState extends State<RHRoommatesScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<RoommateModel> roommateList = getRoommatesList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

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
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          onPressed: () {
            finish(context);
          },
        ),
        centerTitle: true,
        title: Text("Roommate", style: boldTextStyle(size: 16)),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_alt, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              onPressed: () {
                RHRoomFilterScreen().launch(context);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: roommateList.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8, right: 8, bottom: 30, left: 8),
        itemBuilder: (context, index) {
          RoommateModel mData = roommateList[index];
          return GestureDetector(
            onTap: () {
              RHRoommatesDetailsScreen(roomMatesData: mData).launch(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 40, backgroundImage: AssetImage(mData.img.validate())),
                12.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(mData.name.validate(), style: boldTextStyle(size: 16)),
                    12.height,
                    Row(
                      children: [
                        Text(mData.minAmount.validate(), style: boldTextStyle(color: appPrimaryColor, size: 14)),
                        4.width,
                        Text("-", style: boldTextStyle(color: appPrimaryColor)),
                        4.width,
                        Text(mData.maxAmount.validate(), style: boldTextStyle(color: appPrimaryColor, size: 14)),
                      ],
                    ),
                    6.height,
                    Row(
                      children: [
                        Icon(Icons.person_rounded, color: Colors.grey[300]),
                        4.width,
                        Text(mData.gender.validate(), style: secondaryTextStyle(size: 12)),
                      ],
                    ),
                    6.height,
                    Text(mData.description.validate(), style: primaryTextStyle(size: 12))
                  ],
                ).expand()
              ],
            ).paddingAll(8),
          );
        },
      ),
    );
  }
}
