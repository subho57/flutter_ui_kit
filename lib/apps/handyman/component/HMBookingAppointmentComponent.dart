import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HMBookAppointmentStep1 extends StatelessWidget {
  final int pageIndex1;

  HMBookAppointmentStep1(this.pageIndex1);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    return Container(
      child: Column(
        children: [
          Text(bookAppQuestion[pageIndex1].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
          32.height,
          Container(
            height: 250,
            color: appStore.cardColor,
            child: CupertinoTheme(
              data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
              child: CupertinoDatePicker(
                minimumDate: today,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime dateTime) {},
              ),
            ),
          )
        ],
      ),
    ).paddingTop(32);
  }
}

class HMBookAppointmentStep2 extends StatelessWidget {
  final int pageIndex2;

  HMBookAppointmentStep2(this.pageIndex2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(bookAppQuestion[pageIndex2].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
          32.height,
          Container(
            height: 250,
            color: appStore.cardColor,
            child: CupertinoTheme(
                data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                child: CupertinoDatePicker(minuteInterval: 1, mode: CupertinoDatePickerMode.time, onDateTimeChanged: (DateTime dateTime) {})),
          )
        ],
      ),
    ).paddingTop(32);
  }
}

class HMBookAppointmentStep3 extends StatefulWidget {
  final int pageIndex3;

  HMBookAppointmentStep3(this.pageIndex3);

  @override
  _HMBookAppointmentStep3State createState() => _HMBookAppointmentStep3State();
}

class _HMBookAppointmentStep3State extends State<HMBookAppointmentStep3> {
  int selectedIndex3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex3].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex3].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex3];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex3,
                  mainIndex: index,
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(() {
                  selectedIndex3 = index;
                  setState(() {});
                });
              },
            )
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep4 extends StatefulWidget {
  final int pageIndex4;

  HMBookAppointmentStep4(this.pageIndex4);

  @override
  _HMBookAppointmentStep4State createState() => _HMBookAppointmentStep4State();
}

class _HMBookAppointmentStep4State extends State<HMBookAppointmentStep4> {
  int selectedIndex4;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex4].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex4].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex4];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex4,
                  mainIndex: index,
                  icon: data.option[index].icon,
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(
                  () {
                    selectedIndex4 = index;
                    setState(() {});
                  },
                );
              },
            ),
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep5 extends StatefulWidget {
  final int pageIndex5;

  HMBookAppointmentStep5(this.pageIndex5);

  @override
  _HMBookAppointmentStep5State createState() => _HMBookAppointmentStep5State();
}

class _HMBookAppointmentStep5State extends State<HMBookAppointmentStep5> {
  int selectedIndex5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex5].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex5].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex5];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex5,
                  mainIndex: index,
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(
                  () {
                    selectedIndex5 = index;
                    setState(() {});
                  },
                );
              },
            ),
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep6 extends StatefulWidget {
  final int pageIndex6;

  HMBookAppointmentStep6(this.pageIndex6);

  @override
  _HMBookAppointmentStep6State createState() => _HMBookAppointmentStep6State();
}

class _HMBookAppointmentStep6State extends State<HMBookAppointmentStep6> {
  int selectedIndex6;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex6].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex6].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex6];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex6,
                  mainIndex: index,
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(
                  () {
                    selectedIndex6 = index;
                    setState(() {});
                  },
                );
              },
            ),
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep7 extends StatefulWidget {
  final int pageIndex7;

  HMBookAppointmentStep7(this.pageIndex7);

  @override
  _HMBookAppointmentStep7State createState() => _HMBookAppointmentStep7State();
}

class _HMBookAppointmentStep7State extends State<HMBookAppointmentStep7> {
  int selectedIndex7;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex7].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex7].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex7];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex7,
                  mainIndex: index,
                  icon: data.option[index].icon,
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(() {
                  selectedIndex7 = index;
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep8 extends StatefulWidget {
  final int pageIndex8;

  HMBookAppointmentStep8(this.pageIndex8);

  @override
  _HMBookAppointmentStep8State createState() => _HMBookAppointmentStep8State();
}

class _HMBookAppointmentStep8State extends State<HMBookAppointmentStep8> {
  int selectedIndex8;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(bookAppQuestion[widget.pageIndex8].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookAppQuestion[widget.pageIndex8].option.length,
              itemBuilder: (context, index) {
                BookAppointmentQuestion data = bookAppQuestion[widget.pageIndex8];
                return CommonOptionData(
                  optionData: data.option[index].listOption,
                  selectedIndex: selectedIndex8,
                  mainIndex: index,
                  icon: Icon(Icons.emoji_emotions_outlined, color: Colors.amber),
                ).paddingOnly(top: 16, left: 32, right: 32, bottom: 16).onTap(
                  () {
                    selectedIndex8 = index;
                    setState(() {});
                  },
                );
              },
            ),
          ],
        ),
      ).paddingOnly(top: 32, bottom: 64),
    );
  }
}

class HMBookAppointmentStep9 extends StatelessWidget {
  final int pageIndex9;

  HMBookAppointmentStep9(this.pageIndex9);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(bookAppQuestion[pageIndex9].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
          32.height,
          Container(
            width: context.width() * 0.7,
            height: 200,
            decoration: BoxDecoration(color: appStore.cardColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.folder, color: HMColorSecondary, size: 100),
                8.height,
                Text("Select your file here..!", style: secondaryTextStyle(size: 18)),
              ],
            ),
          ).cornerRadiusWithClipRRect(HMCornerRadius)
        ],
      ),
    ).paddingTop(32);
  }
}

class HMBookAppointmentStep10 extends StatelessWidget {
  final int pageIndex10;

  HMBookAppointmentStep10(this.pageIndex10);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Text(bookAppQuestion[pageIndex10].question, style: boldTextStyle(size: 24), textAlign: TextAlign.center),
            32.height,
            Text(
              "Additional details help pros provide the right recommendation, price and service.",
              style: secondaryTextStyle(size: 16),
              textAlign: TextAlign.center,
            ).paddingAll(16),
            16.height,
            Container(
              color: appStore.cardColor,
              width: context.width() * 0.7,
              height: 200,
              child: TextField(
                style: secondaryTextStyle(),
                decoration: InputDecoration(hintText: "Type something...", border: InputBorder.none, hintStyle: secondaryTextStyle()),
              ).paddingAll(8),
            ).cornerRadiusWithClipRRect(HMCornerRadius)
          ],
        ),
      ).paddingTop(32),
    );
  }
}
