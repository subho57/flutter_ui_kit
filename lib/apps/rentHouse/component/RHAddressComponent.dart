import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHAddressComponent extends StatefulWidget {
  @override
  _RHAddressComponentState createState() => _RHAddressComponentState();
}

class _RHAddressComponentState extends State<RHAddressComponent> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCity = 'Louisiana';
  String selectedDistrict = 'Minnesota';
  String selectedWards = 'Louisiana';
  var streetController = TextEditingController();
  var houseController = TextEditingController();
  FocusNode streetNode = FocusNode();
  FocusNode houseNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Citys", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 16),
            width: context.width(),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedCity,
                items: <String>['Louisiana', 'Florida', 'Indiana', 'Montana', 'Nevada'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: secondaryTextStyle(color: Colors.grey)),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCity = newValue;
                  });
                },
              ),
            ),
          ),
          16.height,
          Text("District", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 16),
            width: context.width(),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: DropdownButtonHideUnderline(
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
                ),
                child: DropdownButton<String>(
                  value: selectedDistrict,
                  items: <String>['Minnesota', 'Missouri', 'Nevada', 'Mexico', 'Dakota'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: secondaryTextStyle(color: gray)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDistrict = newValue;
                    });
                  },
                ),
              ),
            ),
          ),
          16.height,
          Text("Wards", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3, left: 16, right: 16),
            width: context.width(),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: DropdownButtonHideUnderline(
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
                ),
                child: DropdownButton<String>(
                  value: selectedWards,
                  items: <String>['Louisiana', 'Florida', 'Indiana', 'Montana', 'Nevada'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: secondaryTextStyle(color: gray)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedWards = newValue;
                    });
                  },
                ),
              ),
            ),
          ),
          16.height,
          Text("Street name", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: streetController,
              textFieldType: TextFieldType.OTHER,
              focus: streetNode,
              autoFocus: false,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              textStyle: secondaryTextStyle(color: gray),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your post title",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          16.height,
          Text("House number", style: secondaryTextStyle(size: 16)),
          8.height,
          Container(
            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: radius(26)),
            child: AppTextField(
              controller: houseController,
              textFieldType: TextFieldType.OTHER,
              focus: houseNode,
              autoFocus: false,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              textStyle: secondaryTextStyle(color: gray),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter House no.",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
