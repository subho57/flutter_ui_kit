import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMessageScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCallScreen extends StatefulWidget {
  static String tag = '/FDCallScreen';

  @override
  FDCallScreenState createState() => FDCallScreenState();
}

class FDCallScreenState extends State<FDCallScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.5,
      duration: Duration(seconds: 3),
    )..repeat();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: FDSelectedTextColor.withOpacity(1 - _controller.value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FDPrimaryColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_outlined, color: white, size: 20).onTap(() {
            finish(context);
          }),
          backgroundColor: FDPrimaryColor,
          elevation: 0,
          toolbarHeight: 70,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  child: AnimatedBuilder(
                    animation: CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          _buildContainer(200 * _controller.value),
                          _buildContainer(300 * _controller.value),
                          Align(child: CircleAvatar(backgroundImage: AssetImage(FDHomeImage1), radius: 50)),
                        ],
                      );
                    },
                  ),
                ),
                Text('Ted Mosby', style: boldTextStyle(color: white)),
                Text('00:23', style: secondaryTextStyle(color: white)),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.call_end, color: white),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                    width: 50,
                    height: 50,
                  ).onTap(() {
                    log('hdh');
                    finish(context);
                  }),
                  30.width,
                  Container(
                    child: Icon(Icons.call, color: white).onTap(() {}),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: FDSelectedTextColor),
                    width: 70,
                    height: 70,
                  ),
                  30.width,
                  Container(
                    child: Icon(Icons.message),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                    width: 50,
                    height: 50,
                  ).onTap(() {
                    FDMessageScreen(isFromCall: true).launch(context);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
