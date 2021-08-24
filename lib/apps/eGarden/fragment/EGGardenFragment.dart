import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGAddPlantScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGPlantDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGDataProvider.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EGGardenFragment extends StatefulWidget {
  static String tag = '/EGGardenFragment';

  @override
  EGGardenFragmentState createState() => EGGardenFragmentState();
}

class EGGardenFragmentState extends State<EGGardenFragment> {
  List<String> listOfImage = [EGBigImgPot04, EGBigImgPot01, EGBigImgPot02, EGBigImgPot03];
  List<EGModel> _plantList = getPlants();
  bool isGridVew = false;

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

  List<Widget> _list() {
    List<Widget> listOfPlant = [];
    _plantList.forEach((element) {
      listOfPlant.add(buildImageSlider(dataModel: element));
    });
    return listOfPlant;
  }

  Widget buildImageSlider({EGModel dataModel}) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Container(
        height: 280,
        color: dataModel.darkColor,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(height: 60, color: dataModel.lightColor.withOpacity(0.5)),
            commonCacheImageWidget(dataModel.image, 180).paddingSymmetric(vertical: 24),
            Column(
              children: [
                Text(dataModel.title.toUpperCase(), style: boldTextStyle(color: dataModel.textColor)),
                4.height,
                Text(dataModel.subtitle.toUpperCase(), style: boldTextStyle(color: white)),
              ],
            ).paddingAll(16),
          ],
        ),
      ).cornerRadiusWithClipRRect(defaultRadius).onTap(() {
        EGPlantDetailsScreen(dataModel: dataModel).launch(context);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("My Gardens", style: boldTextStyle(size: 32)).expand(),
                IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    color: egPrimaryColor1,
                    iconSize: 28,
                    onPressed: () {
                      EGAddPlantScreen().launch(context);
                    })
              ],
            ).paddingOnly(top: 16, left: 16, right: 16),
            Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: -4),
                    iconSize: isGridVew ? 28 : 24,
                    color: isGridVew ? gray.withOpacity(0.5) : grey,
                    icon: Icon(Entypo.grid),
                    onPressed: () {
                      isGridVew = true;
                      setState(() {});
                    }),
                10.width,
                IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: -4),
                    iconSize: isGridVew ? 24 : 28,
                    color: isGridVew ? gray.withOpacity(0.5) : grey,
                    icon: Icon(MaterialIcons.view_carousel),
                    onPressed: () {
                      isGridVew = false;
                      setState(() {});
                    })
              ],
            ).paddingSymmetric(horizontal: 12),
            24.height,
            !isGridVew
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: _list(),
                        options: CarouselOptions(height: 300, viewportFraction: 0.65, enlargeCenterPage: true),
                      ),
                      16.height,
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
                          ),
                        ],
                      ).paddingAll(16),
                      8.height,
                      Text("Plant Types", style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: listOfImage.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  width: context.width() * 0.8,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: AssetImage(listOfImage[index]),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.srgbToLinearGamma(),
                                    ),
                                  ),
                                ),
                                listOfImage.length - 1 == index ? 0.width : 16.width,
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : displayPlantInGridView(plantList: _plantList),
          ],
        ),
      ),
    );
  }
}
