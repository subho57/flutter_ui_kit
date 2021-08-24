import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGPriceScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGStoreFragment extends StatefulWidget {
  static String tag = '/EGStoreFragment';

  @override
  EGStoreFragmentState createState() => EGStoreFragmentState();
}

class EGStoreFragmentState extends State<EGStoreFragment> {
  List<String> listOfImage = [EGBigImgPot01, EGBigImgPot04, EGBigImgPot02, EGBigImgPot03];
  List<Map<String, String>> listOfProducts = [
    {"name": "Plants", "noOfProducts": "155", "image": EGIconPlants},
    {"name": "Flowers", "noOfProducts": "90", "image": EGIconFlowers},
    {"name": "Fertilizers", "noOfProducts": "200", "image": EGIconFertilizer},
    {"name": "Plants", "noOfProducts": "320", "image": EGIconPlants}
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Secret Shop", style: boldTextStyle(size: 32)).paddingSymmetric(horizontal: 16).expand(),
                IconButton(icon: Icon(Icons.local_grocery_store_outlined), color: black, onPressed: () {}),
              ],
            ),
            16.height,
            buildSearchBar(hintText: "Enter plant name").paddingSymmetric(horizontal: 16),
            16.height,
            CarouselSlider(
              items: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(EGBigImgPot02),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.srgbToLinearGamma(),
                        ),
                      ),
                    ),
                    Text("Outer world's plants suitable for indoor deco.", style: boldTextStyle(size: 18, color: white)).paddingAll(16)
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(EGBigImgPot01),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(height: 200, viewportFraction: 0.9, enlargeCenterPage: true),
            ),
            16.height,
            Text("Products", style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
            8.height,
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: listOfProducts.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Card(
                        color: appStore.cardColor,
                        elevation: 2,
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              CircleAvatar(backgroundColor: EGPrimaryColor3, child: commonCacheImageWidget(listOfProducts[index]['image'], 20)),
                              4.height,
                              Text(listOfProducts[index]['name'], style: boldTextStyle(size: 14)),
                              4.height,
                              Text(listOfProducts[index]['noOfProducts'] + "products", style: secondaryTextStyle(size: 12))
                            ],
                          ),
                        ),
                      ).onTap(() {
                        EGPriceScreen(title: listOfProducts[index]['name']).launch(context);
                      }),
                      listOfProducts.length - 1 == index ? 0.width : 16.width,
                    ],
                  );
                },
              ),
            ),
            8.height,
            Text("Plant Types", style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
            8.height,
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
                          image: DecorationImage(image: AssetImage(listOfImage[index]), fit: BoxFit.cover, colorFilter: ColorFilter.srgbToLinearGamma()),
                        ),
                      ),
                      listOfImage.length - 1 == index ? 0.width : 16.width,
                    ],
                  );
                },
              ),
            ),
          ],
        ).paddingSymmetric(vertical: 16),
      ),
    );
  }
}
