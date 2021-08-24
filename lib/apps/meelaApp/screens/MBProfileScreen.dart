import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MBProfileScreen extends StatefulWidget {
  @override
  MBProfileScreenState createState() => MBProfileScreenState();
}

class MBProfileScreenState extends State<MBProfileScreen> {
  String value = '';
  DateTime _date;

  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeDob = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1947), lastDate: DateTime(2030));
    if (_datePicker != null && _datePicker != _date) {
      _date = _datePicker;
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeName.dispose();
    focusNodeDob.dispose();
    focusNodePassword.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              28.height,
              Text('Profile', style: boldTextStyle(size: 26)).paddingOnly(left: 16),
              16.height,
              Row(
                children: [
                  CircularPercentIndicator(
                    radius: 90,
                    lineWidth: 4.0,
                    percent: 0.6,
                    progressColor: appPrimaryColor,
                    center: Image.asset(mb_profile1, height: 82, width: 82, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Samuel', style: boldTextStyle(size: 18)),
                      4.height,
                      Text('FlatCher', style: boldTextStyle(size: 18, color: appPrimaryColor)),
                      4.height,
                      Text('Credit Score : \$25,000', overflow: TextOverflow.visible, maxLines: 1, style: primaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
              16.height,
              Container(
                  height: 110,
                  width: context.width(),
                  color: appPrimaryColor,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('United State Of Bank Ltd.', style: primaryTextStyle(color: Colors.white)),
                          4.height,
                          Text('Credit : \$5,000,00', style: boldTextStyle(color: Colors.white)),
                        ],
                      ).paddingOnly(top: 32, left: 8).expand(),
                      16.width,
                      Column(
                        children: [
                          AppButton(onTap: () {}, width: 100, child: Text('update', style: boldTextStyle(color: appPrimaryColor))),
                        ],
                      ).paddingOnly(top: 32, right: 16)
                    ],
                  )).cornerRadiusWithClipRRect(10),
              16.height,
              Text('Name', style: boldTextStyle()),
              4.height,
              textFieldWidget(
                hintText: 'Enter Name',
                textFieldType: TextFieldType.NAME,
                focusNode: focusNodeName,
                nextFocusNode: focusNodeDob,
                controller: nameController,
              ),
              4.height,
              Text('Date of Birth', style: boldTextStyle()),
              4.height,
              textFieldWidget(
                hintText: 'Enter Date of birth',
                textFieldType: TextFieldType.OTHER,
                focusNode: focusNodeDob,
                nextFocusNode: focusNodePassword,
                controller: dobController,
                icon: Icon(
                  Icons.date_range,
                  size: 18,
                  color: appPrimaryColor,
                ).onTap(
                  () async {
                    await selectDate(context);
                    dobController.text = _date.day.toString();
                    dobController.text = _date.month.toString();
                    dobController.text = _date.year.toString();
                    value = dobController.text = _date.day.toString() + "/" + _date.month.toString() + "/" + _date.year.toString();
                    setState(() {});
                  },
                ),
              ),
              4.height,
              Text('Password', style: boldTextStyle()),
              4.height,
              textFieldWidget(
                hintText: 'Enter Password',
                textFieldType: TextFieldType.PASSWORD,
                focusNode: focusNodePassword,
                controller: passWordController,
              ),
              16.height,
              AppButton(
                width: context.width(),
                color: appPrimaryColor,
                elevation: 12,
                onTap: () {},
                child: Text('Update Changes', style: boldTextStyle(color: Colors.white)),
              )
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ),
      ),
    );
  }
}
