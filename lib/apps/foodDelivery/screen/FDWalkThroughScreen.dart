import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDWelcomeScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FDWalkThroughScreen extends StatefulWidget {
  static String tag = '/FDWalkThroughScreen';

  @override
  FDWalkThroughScreenState createState() => FDWalkThroughScreenState();
}

class FDWalkThroughScreenState extends State<FDWalkThroughScreen> {
  Widget fdWalkThroughWidget(String image, String text, BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: context.height(),
          fit: BoxFit.cover,
          alignment: Alignment.bottomLeft,
        ),
        Positioned(
          top: 100.0,
          child: Text(
            text,
            style: boldTextStyle(color: FDTextColor),
          ).paddingLeft(16.0),
        ),
      ],
    );
  }

  Widget fdCustomIndicatorWidget(bool selected, BuildContext context) {
    return Container(
      height: 3.0,
      width: context.width() / 5,
      color: selected ? FDSelectedTextColor : grey,
    ).cornerRadiusWithClipRRect(12);
  }

  int _pageIndex = 0;
  PageController _pageControllerWalkThrough;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.yellow);
    _pageControllerWalkThrough = PageController(initialPage: _pageIndex);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _pageControllerWalkThrough.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              fdWalkThroughWidget(
                FDWalkThroughImage,
                'Brow the largest variety \nof food, groceries, drink \nand more.',
                context,
              ),
              fdWalkThroughWidget(
                FDWalkThroughImage,
                'Track your delivery in \nrealtime.',
                context,
              ),
              fdWalkThroughWidget(
                FDWalkThroughImage,
                'Pickup delivery \nat door step and enjoy \nyour meal & groceries.',
                context,
              ),
              FDWelcomeScreen(),
            ],
            controller: _pageControllerWalkThrough,
            onPageChanged: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
          ),
          Positioned(
            top: 50.0,
            right: 16,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 4; i++)
                  if (i <= _pageIndex) fdCustomIndicatorWidget(true, context) else fdCustomIndicatorWidget(false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
