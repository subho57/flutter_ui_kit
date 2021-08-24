import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDMoreFoodsComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFoodDetailsScreen extends StatefulWidget {
  static String tag = '/FDFoodDetailsScreen';

  final FDPopularItemModel data;
  final bool isFoodFromHome;
  final bool isFoodFromShipping;

  FDFoodDetailsScreen({this.data, this.isFoodFromHome = false, this.isFoodFromShipping = false});

  @override
  FDFoodDetailsScreenState createState() => FDFoodDetailsScreenState();
}

class FDFoodDetailsScreenState extends State<FDFoodDetailsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    if (widget.isFoodFromHome) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else if (widget.isFoodFromShipping) {
      setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_outlined).onTap(() {
          finish(context);
        }),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: boxDecorationRoundedWithShadow(8),
              width: context.width(),
              child: Column(
                children: [
                  Text(widget.data.name, style: boldTextStyle(size: 30)),
                  Text('\$${widget.data.price}', style: boldTextStyle(size: 16)),
                  8.height,
                  Image.asset(
                    widget.data.image,
                    width: context.width() * 0.60,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            FDMoreFoodsComponent(),
            Text('Description', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            8.height,
            Text(widget.data.description, textAlign: TextAlign.justify, style: primaryTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
            16.height,
          ],
        ),
      ).withHeight(context.height()),
      bottomNavigationBar: fdAppButton(
        widget.data.isCart ? FDRedColor : FDPrimaryColor,
        () {
          setState(() {
            widget.data.isCart = !widget.data.isCart;
          });
        },
        context,
        widget.data.isCart ? 'Remove Cart' : 'Add to Cart',
      ).paddingAll(16),
    );
  }
}
