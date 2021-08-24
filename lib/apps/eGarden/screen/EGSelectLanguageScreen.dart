import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGSelectLanguageScreen extends StatefulWidget {
  static String tag = '/EGSelectLanguageScreen';

  @override
  EGSelectLanguageScreenState createState() => EGSelectLanguageScreenState();
}

class EGSelectLanguageScreenState extends State<EGSelectLanguageScreen> {
  List<EGLanguageModel> list = getLanguages();

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
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Select Language", center: true, elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: list.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 4),
                    padding: EdgeInsets.all(8),
                    color: list[index].isSelect ? egPrimaryColor1 : appStore.cardColor,
                    height: 40,
                    child: Row(
                      children: [
                        Text(list[index].language, style: primaryTextStyle(size: 18, color: list[index].isSelect ? white : gray)).expand(),
                        commonCacheImageWidget(list[index].image, 25),
                        12.width,
                        Container(
                          width: 25,
                          height: 25,
                          child: list[index].isSelect ? Icon(Icons.check, color: white, size: 20) : null,
                          decoration: list[index].isSelect ? BoxDecoration(shape: BoxShape.circle, color: egPrimaryColor1) : BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    for (int i = 0; i < list.length; i++) {
                      if (i == index) {
                        setState(() {
                          list[i].isSelect = true;
                        });
                      } else {
                        setState(() {
                          list[i].isSelect = false;
                        });
                      }
                    }
                  });
                },
              ).paddingAll(16)
            ],
          ),
        ),
      ),
    );
  }
}
