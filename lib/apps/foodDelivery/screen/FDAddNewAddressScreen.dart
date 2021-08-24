import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDAddNewAddressScreen extends StatefulWidget {
  static String tag = '/FDAddNewAddressScreen';

  @override
  FDAddNewAddressScreenState createState() => FDAddNewAddressScreenState();
}

class FDAddNewAddressScreenState extends State<FDAddNewAddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  String addressName = "";
  int selectedIndex = 0;

  List<String> chipItems = ['Home', 'Company', 'Others'];

  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  FocusNode addressFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode contactNoFocus = FocusNode();
  FocusNode nameOfAddressFocus = FocusNode();

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
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Add New Address', context: context),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            16.height,
            Text('Address', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            8.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: AppTextField(
                controller: addressController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                  fillColor: grey.withOpacity(0.1),
                  contentPadding: EdgeInsets.only(left: 16, right: 16),
                  filled: true,
                ),
                focus: addressFocus,
                nextFocus: nameFocus,
              ).paddingAll(16),
            ).paddingOnly(left: 16, right: 16),
            16.height,
            Text('Contact', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            8.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: secondaryTextStyle()),
                  8.height,
                  AppTextField(
                    controller: nameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                      fillColor: grey.withOpacity(0.1),
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 16, right: 16),
                    ),
                    focus: nameFocus,
                    nextFocus: contactNoFocus,
                  ),
                  16.height,
                  Text(
                    'Phone Number',
                    style: secondaryTextStyle(),
                  ),
                  8.height,
                  AppTextField(
                    controller: contactNoController,
                    textFieldType: TextFieldType.PHONE,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(style: BorderStyle.none)),
                      fillColor: grey.withOpacity(0.1),
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 16, right: 16),
                    ),
                    focus: contactNoFocus,
                    nextFocus: nameOfAddressFocus,
                  ),
                ],
              ).paddingAll(16),
            ).paddingOnly(left: 16, right: 16),
            16.height,
            Text(
              'Name of Address',
              style: boldTextStyle(),
            ).paddingOnly(left: 16, right: 16),
            8.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  chipItems.length,
                  (index) {
                    return ChoiceChip(
                      labelPadding: EdgeInsets.only(left: 16, right: 16),
                      selected: selectedIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          selectedIndex = selected ? index : null;
                          addressName = selected ? chipItems[index] : null;
                          log('chip value: $addressName');
                        });
                      },
                      label: Text(chipItems[index], style: primaryTextStyle()),
                      selectedColor: FDSelectedTextColor.withOpacity(0.2),
                      backgroundColor: grey.withOpacity(0.1),
                      focusNode: nameOfAddressFocus,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    );
                  },
                ),
              ),
            ).paddingOnly(left: 16, right: 16),
            16.height,
          ],
        ),
      ),
      bottomNavigationBar: fdAppButton(
        FDPrimaryColor,
        () {
          finish(context);
        },
        context,
        'Save',
      ).paddingAll(16),
    );
  }
}
