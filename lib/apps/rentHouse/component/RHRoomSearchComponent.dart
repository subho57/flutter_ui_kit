import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHRoomSearchComponent extends StatefulWidget {
  static String tag = '/RHRoomSearchComponent';

  @override
  RHRoomSearchComponentState createState() => RHRoomSearchComponentState();
}

class RHRoomSearchComponentState extends State<RHRoomSearchComponent> {
  var searchController = TextEditingController();
  RangeValues currentRangeValues = RangeValues(10, 5000);
  String selectedHouse = 'All';
  var phoneController = TextEditingController();
  FocusNode phoneNode = FocusNode();
  var mCuisine;
  List<String> tags = [];
  List<String> options = ['Houston', 'Nashville', 'Fort Worth', 'Louisville', 'Kansas City'];

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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      title: Text("Instantly search room", style: boldTextStyle(size: 18), textAlign: TextAlign.center),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Phone number", style: secondaryTextStyle(color: Colors.grey)),
            8.height,
            Container(
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 16),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
              child: AppTextField(
                controller: phoneController,
                textFieldType: TextFieldType.EMAIL,
                focus: phoneNode,
                autoFocus: false,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone number",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            16.height,
            Text("Price range", style: secondaryTextStyle(color: Colors.grey)),
            8.height,
            RangeSlider(
              values: currentRangeValues,
              activeColor: appPrimaryColor,
              min: 0,
              max: 5000,
              divisions: 10,
              labels: RangeLabels(
                '${currentRangeValues.start.round().toString()} USD',
                '${currentRangeValues.end.round().toString()} USD',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  currentRangeValues = values;
                });
              },
            ),
            16.height,
            Container(
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 16),
              width: context.width(),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedHouse,
                  items: <String>['All', 'House', 'Apartment', 'Bungalow', 'Row House'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedHouse = newValue;
                    });
                  },
                ),
              ),
            ),
            8.height,
            Text("Area", style: secondaryTextStyle(color: Colors.grey)),
            16.height,
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
                showCheckmark: false,
                borderShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  side: BorderSide(color: Colors.grey[200]),
                ),
                labelStyle: secondaryTextStyle(size: 14, color: Colors.black),
              ),
              choiceItems: C2Choice.listFrom<String, String>(
                source: options,
                value: (i, v) => v,
                label: (i, v) => v,
              ),
              wrapped: true,
            ),
            30.height,
            AppButton(
              color: appPrimaryColor,
              width: context.width(),
              child: Text('Search room', style: boldTextStyle(size: 14, color: white)),
              onTap: () {
                finish(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
            ),
            30.height,
            Align(
              alignment: Alignment.center,
              child: Text("Cancel", style: boldTextStyle(color: appPrimaryColor, size: 16), textAlign: TextAlign.center).onTap(() {
                finish(context);
              }),
            ),
          ],
        ).paddingOnly(top: 16),
      ),
    );
  }
}
