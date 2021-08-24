import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EGPlantDetailsScreen extends StatefulWidget {
  static String tag = '/EGPlantDetailsScreen';

  final EGModel dataModel;

  EGPlantDetailsScreen({Key key, this.dataModel}) : super(key: key);

  @override
  EGPlantDetailsScreenState createState() => EGPlantDetailsScreenState();
}

class EGPlantDetailsScreenState extends State<EGPlantDetailsScreen> {
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
        appBar: appBarWidget(
          "",
          actions: [
            IconButton(
                icon: Icon(Icons.edit_outlined, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                onPressed: () async {
                  TextEditingController _controller = TextEditingController();
                  _controller.text = widget.dataModel.title;
                  _controller = await buildRenameDialog(context, _controller);
                  if (_controller.text != widget.dataModel.title) {
                    widget.dataModel.title = _controller.text;
                    setState(() {});
                  }
                }),
            IconButton(
              icon: Icon(Icons.delete_outline, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              onPressed: () {
                buildDeleteDialog(context, widget.dataModel.title);
              },
            )
          ],
          color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.dataModel.title, style: boldTextStyle(size: 32)),
              8.height,
              Text("Robust and dramatic,\nwith no leaves", style: secondaryTextStyle(size: 16)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [Icon(Icons.brightness_5, color: egPrimaryColor1, size: 18), 16.width, Text("Sun 8-12 days", style: secondaryTextStyle())]),
                      16.height,
                      Row(children: [Icon(MaterialCommunityIcons.water, color: egPrimaryColor1, size: 18), 16.width, Text("Every 7 days", style: secondaryTextStyle())]),
                      16.height,
                      Row(children: [Icon(Icons.brightness_5, color: egPrimaryColor1, size: 18), 16.width, Text("Best at 18°C - 30°C", style: secondaryTextStyle())]),
                      16.height,
                      Row(children: [Icon(MaterialCommunityIcons.leaf, color: egPrimaryColor1, size: 18), 16.width, Text("Sprouts in: 7-14 days", style: secondaryTextStyle())]),
                      16.height,
                      Row(children: [Icon(AntDesign.hearto, color: egPrimaryColor1, size: 18), 16.width, Text("Enjoy for: 90-112 days", style: secondaryTextStyle())]),
                    ],
                  ),
                  24.width,
                  commonCacheImageWidget(widget.dataModel.image, 200).expand(),
                ],
              ),
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Water".toUpperCase(), style: boldTextStyle(size: 14)),
                      8.height,
                      CircularPercentIndicator(
                        radius: 70,
                        animation: true,
                        animationDuration: 1000,
                        percent: 0.2,
                        progressColor: egPrimaryColor1,
                        backgroundColor: transparentColor.withOpacity(0.1),
                        center: Icon(MaterialCommunityIcons.water),
                      ).onTap(() {
                        buildWaterCustomizeDialog(context);
                      }),
                      8.height,
                      Text("2 Days".toUpperCase(), style: boldTextStyle(size: 14)),
                      8.height,
                      Text("Every 7 Days".toUpperCase(), style: secondaryTextStyle(size: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Light".toUpperCase(), style: boldTextStyle(size: 14)),
                      8.height,
                      CircularPercentIndicator(
                        radius: 70,
                        percent: 0.65,
                        animationDuration: 1000,
                        animation: true,
                        progressColor: EGSemanticColor2,
                        backgroundColor: transparentColor.withOpacity(0.1),
                        center: Icon(MaterialIcons.brightness_5),
                      ).onTap(() {
                        buildLightCustomizeDialog(context);
                      }),
                      8.height,
                      Text("65%".toUpperCase(), style: boldTextStyle(size: 14)),
                      8.height,
                      Text("18 hrs a Days".toUpperCase(), style: secondaryTextStyle(size: 12)),
                    ],
                  )
                ],
              ),
              32.height,
              Text("Days Planted".toUpperCase(), style: boldTextStyle()).center(),
              16.height,
              Container(
                height: 10,
                width: context.width() * 0.7,
                child: Stack(
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: grey.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.235,
                      child: Container(
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1, borderRadius: BorderRadius.circular(16)),
                      ),
                    )
                  ],
                ),
              ).center(),
              8.height,
              Text("15 Days".toUpperCase(), style: boldTextStyle(color: egPrimaryColor1, size: 14)).center(),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
