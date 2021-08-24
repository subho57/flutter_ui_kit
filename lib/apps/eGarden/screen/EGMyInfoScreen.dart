import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGMyInfoScreen extends StatefulWidget {
  static String tag = '/EGMyInfoScreen';

  @override
  EGMyInfoScreenState createState() => EGMyInfoScreenState();
}

class EGMyInfoScreenState extends State<EGMyInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController genderCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    fNameCtrl.text = "John";
    lNameCtrl.text = "Dae";
    emailCtrl.text = "johndae@gmail.com";
    genderCtrl.text = "Male";
    phoneCtrl.text = "740 523 6389";
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    fNameCtrl.dispose();
    lNameCtrl.dispose();
    emailCtrl.dispose();
    genderCtrl.dispose();
    phoneCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("My info", center: true, elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About Me", style: boldTextStyle(size: 20)),
                16.height,
                Row(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: fNameCtrl,
                      style: secondaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "First Name",
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                      ),
                    ).expand(),
                    16.width,
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: lNameCtrl,
                      style: secondaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                      ),
                    ).expand()
                  ],
                ),
                16.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtrl,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    labelStyle: secondaryTextStyle(size: 16),
                  ),
                ),
                16.height,
                Row(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: genderCtrl,
                      style: secondaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Gender",
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                      ),
                    ).expand(),
                    16.width,
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: phoneCtrl,
                      style: secondaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                      ),
                    ).expand()
                  ],
                ),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address", style: boldTextStyle(size: 18)),
                    Row(
                      children: [
                        Icon(Icons.add, color: egPrimaryColor1),
                        8.width,
                        Text("New Address", style: boldTextStyle(size: 16, color: egPrimaryColor1)),
                      ],
                    )
                  ],
                ),
                16.height,
                settingList(
                  title: "222 Cullingworth Mills Yard",
                  subtitle: "222 Cullingworth Mills Yard, Halifax",
                  iconLeading: Icons.location_on_outlined,
                ),
                8.height,
                settingList(title: "31 Canterbury Road", subtitle: "31 Canterbury Road, Valley Field", iconLeading: Icons.location_on_outlined),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment", style: boldTextStyle(size: 18)),
                    Row(
                      children: [
                        Icon(Icons.add, color: egPrimaryColor1),
                        8.width,
                        Text("New Card", style: boldTextStyle(size: 16, color: egPrimaryColor1)),
                      ],
                    )
                  ],
                ),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: EGPrimaryColor3,
                      child: commonCacheImageWidget(EGIconVisa, 30),
                    ),
                    24.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Visa / Visa Debit", style: primaryTextStyle()),
                        2.height,
                        Text("xxxx xxxx xxxx 2444", style: secondaryTextStyle(color: Colors.grey)),
                        2.height,
                        Text("Expiry : 09/20", style: secondaryTextStyle(color: Colors.grey[350])),
                      ],
                    ).expand(),
                    Text("CVV : 328", style: secondaryTextStyle(size: 16, color: Colors.grey[350]))
                  ],
                ),
                8.height,
                Divider(thickness: 1),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(backgroundColor: EGPrimaryColor3, child: commonCacheImageWidget(EGIconMasterCard, 30)),
                    24.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Master Card", style: primaryTextStyle()),
                        2.height,
                        Text("xxxx xxxx xxxx 8080", style: secondaryTextStyle(color: Colors.grey)),
                        2.height,
                        Text("Expiry : 09/20", style: secondaryTextStyle(color: Colors.grey[350])),
                      ],
                    ).expand(),
                    Text("CVV : 652", style: secondaryTextStyle(size: 16, color: Colors.grey[350]))
                  ],
                )
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
