import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHInformationComponent extends StatefulWidget {
  @override
  _RHInformationComponentState createState() => _RHInformationComponentState();
}

class _RHInformationComponentState extends State<RHInformationComponent> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var depositController = TextEditingController();

  var electricityController = TextEditingController();

  var waterController = TextEditingController();

  var internetController = TextEditingController();

  FocusNode depositNode = FocusNode();

  FocusNode electricityNode = FocusNode();

  FocusNode waterNode = FocusNode();

  FocusNode internetNode = FocusNode();

  bool electricityCheckBox = false;

  bool waterCheckBox = false;

  bool internetCheckBox = false;

  bool isParking = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deposit", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: depositController,
              textFieldType: TextFieldType.OTHER,
              focus: depositNode,
              autoFocus: false,
              textStyle: secondaryTextStyle(color: appStore.isDarkModeOn ? scaffoldColorDark : scaffoldColorDark),
              nextFocus: electricityNode,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter deposit",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          16.height,
          Text("Electricity", style: secondaryTextStyle(size: 16)),
          8.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
                child: AppTextField(
                  controller: electricityController,
                  textFieldType: TextFieldType.OTHER,
                  focus: electricityNode,
                  autoFocus: false,
                  nextFocus: waterNode,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  textStyle: secondaryTextStyle(color: appStore.isDarkModeOn ? scaffoldColorDark : scaffoldColorDark),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter electricity",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ).expand(),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                ),
                child: Checkbox(
                  activeColor: appPrimaryColor,
                  value: electricityCheckBox,
                  onChanged: (value) {
                    setState(() {
                      electricityCheckBox = !electricityCheckBox;
                    });
                  },
                ),
              ),
              Text("Free", style: secondaryTextStyle())
            ],
          ),
          16.height,
          Text("Water", style: secondaryTextStyle(size: 16)),
          8.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
                child: AppTextField(
                  controller: waterController,
                  textFieldType: TextFieldType.OTHER,
                  focus: waterNode,
                  autoFocus: false,
                  nextFocus: internetNode,
                  textAlign: TextAlign.start,
                  textStyle: secondaryTextStyle(color: appStore.isDarkModeOn ? scaffoldColorDark : scaffoldColorDark),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Water cost",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ).expand(),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                ),
                child: Checkbox(
                  activeColor: appPrimaryColor,
                  value: waterCheckBox,
                  onChanged: (value) {
                    setState(() {
                      waterCheckBox = !waterCheckBox;
                    });
                  },
                ),
              ),
              Text("Free", style: secondaryTextStyle())
            ],
          ),
          16.height,
          Text("Internet", style: secondaryTextStyle(size: 16)),
          8.height,
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
                child: AppTextField(
                  controller: internetController,
                  textFieldType: TextFieldType.OTHER,
                  focus: internetNode,
                  autoFocus: false,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  textStyle: secondaryTextStyle(color: appStore.isDarkModeOn ? scaffoldColorDark : scaffoldColorDark),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Internet cost",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ).expand(),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                ),
                child: Checkbox(
                  activeColor: appPrimaryColor,
                  value: internetCheckBox,
                  onChanged: (value) {
                    setState(() {
                      internetCheckBox = !internetCheckBox;
                    });
                  },
                ),
              ),
              Text("Free", style: secondaryTextStyle())
            ],
          ),
          16.height,
          Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                ),
                child: Checkbox(
                  activeColor: appPrimaryColor,
                  value: isParking,
                  onChanged: (value) {
                    setState(() {
                      isParking = !isParking;
                    });
                  },
                ),
              ),
              Text("Is there space for parking?", style: secondaryTextStyle(size: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
