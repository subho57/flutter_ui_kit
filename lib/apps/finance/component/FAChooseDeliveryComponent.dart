import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';

import 'FADeliveryCardItemComponent.dart';

class FAChooseDeliveryComponent extends StatefulWidget {
  static String tag = '/FAChooseDeliveryComponent';

  @override
  FAChooseDeliveryComponentState createState() => FAChooseDeliveryComponentState();
}

class FAChooseDeliveryComponentState extends State<FAChooseDeliveryComponent> {
  final List<FADeliveryCardModel> deliveryCartList = getDeliveryCard();

  int currentIndex = 0;

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
    return CarouselSlider.builder(
      itemCount: deliveryCartList.length,
      itemBuilder: (BuildContext context, int index) {
        FADeliveryCardModel mData = deliveryCartList[index];

        return FADeliveryCardItemComponent(
          deliveryCard: mData,
          currentIndex: currentIndex,
          index: index,
        );
      },
      options: CarouselOptions(
        initialPage: currentIndex,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        autoPlay: false,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
