import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHRoomFilterScreen extends StatefulWidget {
  static String tag = '/RHRoomFilterScreen';

  @override
  RHRoomFilterScreenState createState() => RHRoomFilterScreenState();
}

class RHRoomFilterScreenState extends State<RHRoomFilterScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> filterCityList = ['San Antonio', 'Dallas', 'El Paso'];
  List<String> genderList = ['FeMale', 'Male'];
  List<String> utilitiesList = ['Internet', 'Water', 'Light', 'Parking', 'Tv', 'Air Conditioner', 'Washing', 'Bed'];
  List<String> tags = [];

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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            finish(context);
          },
        ),
        centerTitle: true,
        title: Text("Filter", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChipsChoice<String>.multiple(
              spacing: 8,
              padding: EdgeInsets.all(0),
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceActiveStyle: C2ChoiceStyle(
                labelStyle: secondaryTextStyle(size: 14, color: Colors.blueAccent),
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.blueAccent),
                ),
              ),
              choiceStyle: C2ChoiceStyle(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 20, right: 20),
                showCheckmark: false,
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.grey[200]),
                ),
                labelStyle: secondaryTextStyle(size: 14, color: Colors.black),
              ),
              choiceItems: C2Choice.listFrom<String, String>(
                source: filterCityList,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
              wrapped: true,
            ),
            30.height,
            Text("Gender", style: boldTextStyle()),
            20.height,
            ChipsChoice<String>.multiple(
              spacing: 8,
              padding: EdgeInsets.all(0),
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceActiveStyle: C2ChoiceStyle(
                labelStyle: secondaryTextStyle(size: 14, color: Colors.blueAccent),
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.blueAccent),
                ),
              ),
              choiceStyle: C2ChoiceStyle(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 20, right: 20),
                showCheckmark: false,
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.grey[200]),
                ),
                labelStyle: secondaryTextStyle(size: 14, color: Colors.black),
              ),
              choiceItems: C2Choice.listFrom<String, String>(
                source: genderList,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
              wrapped: true,
            ),
            30.height,
            Text("Utilities", style: boldTextStyle()),
            20.height,
            ChipsChoice<String>.multiple(
              spacing: 8,
              padding: EdgeInsets.all(0),
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceActiveStyle: C2ChoiceStyle(
                labelStyle: secondaryTextStyle(size: 14, color: Colors.blueAccent),
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.blueAccent),
                ),
              ),
              choiceStyle: C2ChoiceStyle(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(left: 20, right: 20),
                showCheckmark: false,
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.grey[200]),
                ),
                labelStyle: secondaryTextStyle(size: 14, color: Colors.black),
              ),
              choiceItems: C2Choice.listFrom<String, String>(
                source: utilitiesList,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
              wrapped: true,
            ),
            80.height,
            AppButton(
              color: appPrimaryColor,
              width: context.width(),
              child: Text('Apply filter', style: boldTextStyle(size: 14, color: white)),
              onTap: () {
                finish(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
