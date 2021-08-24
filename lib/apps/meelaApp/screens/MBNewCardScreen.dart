import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBNewCardScreen extends StatefulWidget {
  static String tag = '/MBNewCardScreen';

  @override
  MBNewCardScreenState createState() => MBNewCardScreenState();
}

class MBNewCardScreenState extends State<MBNewCardScreen> {
  String value = '';
  DateTime _date;

  Future<Null> selectDate(BuildContext context) async {
    DateTime _datePicker = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1947), lastDate: DateTime(2030));
    if (_datePicker != null && _datePicker != _date) {
      setState(() {
        _date = _datePicker;
      });
    }
  }

  TextEditingController cardNumController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  FocusNode focusNodeCardName = FocusNode();
  FocusNode focusNodeCardHolderName = FocusNode();
  FocusNode focusNodeExpiryDate = FocusNode();
  FocusNode focusNodeCvv = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNodeCardName.dispose();
    focusNodeCardHolderName.dispose();
    focusNodeExpiryDate.dispose();
    focusNodeCvv.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
              32.height,
              Text('Add New Card', style: boldTextStyle(size: 24)),
              16.height,
              mastercardWidget(width: context.width()),
              16.height,
              Text('Fill in the fields below to add a new card', style: primaryTextStyle()),
              16.height,
              textFieldWidget(
                hintText: 'Please 14 digit card number',
                length: 14,
                textFieldType: TextFieldType.PHONE,
                focusNode: focusNodeCardName,
                nextFocusNode: focusNodeCardHolderName,
                controller: cardNumController,
              ).cornerRadiusWithClipRRect(10),
              8.height,
              textFieldWidget(
                hintText: 'card holder name',
                textFieldType: TextFieldType.NAME,
                focusNode: focusNodeCardHolderName,
                nextFocusNode: focusNodeExpiryDate,
                controller: cardHolderNameController,
              ),
              16.height,
              Container(
                height: 80,
                width: context.width(),
                child: Row(
                  children: [
                    textFieldWidget(
                      hintText: 'Expiry Date',
                      textFieldType: TextFieldType.OTHER,
                      length: 12,
                      focusNode: focusNodeExpiryDate,
                      nextFocusNode: focusNodeCvv,
                      controller: expiryDateController,
                      icon: Icon(Icons.date_range, size: 18, color: appPrimaryColor).onTap(() async {
                        await selectDate(context);
                        setState(() {});
                        expiryDateController.text = _date.day.toString();
                        expiryDateController.text = _date.month.toString();
                        expiryDateController.text = _date.year.toString();
                        value = expiryDateController.text = _date.day.toString() + "/" + _date.month.toString() + "/" + _date.year.toString();
                      }),
                    ).expand(),
                    4.width,
                    textFieldWidget(
                      hintText: 'CVV',
                      textFieldType: TextFieldType.PHONE,
                      length: 3,
                      focusNode: focusNodeCvv,
                      controller: cvvController,
                    ).expand(),
                  ],
                ),
              ),
              16.height,
              AppButton(
                width: context.width(),
                color: appPrimaryColor,
                onTap: () {},
                child: Text('Place BTN Text Here', textAlign: TextAlign.center, style: secondaryTextStyle(color: Colors.white)),
              )
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ),
      ),
    );
  }
}
