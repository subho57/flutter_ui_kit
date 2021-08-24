import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:nb_utils/nb_utils.dart';

class HSDeviceDialogComponent extends StatefulWidget {
  static String tag = '/Dialog';

  @override
  HSDeviceDialogComponentState createState() => HSDeviceDialogComponentState();
}

class HSDeviceDialogComponentState extends State<HSDeviceDialogComponent> {
  var deviceController = TextEditingController();
  Item selectedUser;
  List<HSDeviceModel> deviceList = getDeviceList();
  String selectIcon;

  List<Item> users = <Item>[
    Item(HS_notification),
    Item(HS_world_icon),
    Item(HS_home_icon),
    Item(HS_fan_icon),
    Item(HS_lamp_icon),
  ];

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
    return AlertDialog(
      title: Text("Add Device", style: boldTextStyle(size: 16, color: hsColorAccent)),
      contentPadding: EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: AppTextField(
                  controller: deviceController,
                  textFieldType: TextFieldType.NAME,
                  textAlign: TextAlign.start,
                  autoFocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixStyle: TextStyle(color: Colors.white),
                    hintText: "Device Name",
                    hintStyle: secondaryTextStyle(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textSecondaryColorGlobal),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textSecondaryColorGlobal),
                    ),
                  ),
                ),
              ),
            ],
          ),
          10.height,
          Container(
            width: 300.0,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                child: DropdownButton<Item>(
                  isExpanded: true,
                  hint: Text("Select icon", style: primaryTextStyle()),
                  value: selectedUser,
                  onChanged: (Item value) {
                    hideKeyboard(context);
                    setState(() {
                      selectedUser = value;
                      selectIcon = value.icon;
                      //selectIcon = value.toString();
                      //print(value);
                      print(selectIcon);
                    });
                  },
                  items: users.map((Item user) {
                    return DropdownMenuItem<Item>(
                      value: user,
                      child: Row(
                        children: <Widget>[
                          Image.asset(user.icon),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('CANCEL', style: primaryTextStyle(size: 14)),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            child: Text('ADD', style: primaryTextStyle(size: 14)),
            onPressed: () {
              setState(() {
                deviceList.add(HSDeviceModel(deviceName: deviceController.text, deviceIcon: selectIcon, status: "", isOn: false));
                log(deviceList.length);
                finish(context);
              });
            })
      ],
    );
  }
}

class Item {
  const Item(this.icon);

  final String icon;
}
