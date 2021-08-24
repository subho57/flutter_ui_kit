import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDTrapezoidShape.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFoodReviewComponent extends StatefulWidget {
  static String tag = '/FDFoodReviewComponent';

  final FDMyOrderHistoryItemModel item;

  FDFoodReviewComponent(this.item);

  @override
  FDFoodReviewComponentState createState() => FDFoodReviewComponentState();
}

class FDFoodReviewComponentState extends State<FDFoodReviewComponent> {
  List<FDHomeItemModel> images = fdGetHomeItems();

  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Trapezoid(
                cutLength: 20,
                child: Container(
                  height: 150,
                  width: context.width(),
                  color: FDSelectedTextColor.withOpacity(0.2),
                  margin: EdgeInsets.only(top: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      30.height,
                      Text(widget.item.name, style: boldTextStyle(color: white)),
                      Text('\$${widget.item.dollarPrice.toDouble()}', style: secondaryTextStyle(color: white)),
                    ],
                  ),
                ).cornerRadiusWithClipRRect(16),
              ),
              Image.asset(
                widget.item.image,
                width: context.width() * 0.4,
                fit: BoxFit.fill,
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
          30.height,
          Container(
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text('Rate & Review', style: boldTextStyle()).center(),
                30.height,
                Text('Rate', style: primaryTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
                8.height,
                RatingBar.builder(
                  itemCount: 5,
                  initialRating: 0,
                  minRating: 0,
                  maxRating: 5,
                  itemSize: 40,
                  unratedColor: grey.withOpacity(0.2),
                  itemPadding: EdgeInsets.only(left: 8, right: 8),
                  itemBuilder: (context, index) {
                    return Icon(Icons.star, color: FDSecondaryColor);
                  },
                  onRatingUpdate: (value) {},
                ).center(),
                16.height,
                Text('Images', style: primaryTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
                8.height,
                Container(
                  height: 70,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Image.asset(images[index].image, width: 70, fit: BoxFit.cover).cornerRadiusWithClipRRect(8).paddingRight(8);
                    },
                  ),
                ),
                16.height,
                Text('Review', style: primaryTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
                8.height,
                AppTextField(
                  controller: reviewController,
                  textFieldType: TextFieldType.OTHER,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: grey.withOpacity(0.1),
                  ),
                  maxLines: 2,
                  autoFocus: false,
                ).paddingOnly(left: 16, right: 16),
                16.height,
                fdAppButton(FDPrimaryColor, () {}, context, 'Submit').paddingOnly(left: 16, right: 16),
                16.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
