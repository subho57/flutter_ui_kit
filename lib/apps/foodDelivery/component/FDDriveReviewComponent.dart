import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDDriveReviewComponent extends StatefulWidget {
  static String tag = '/FDDriveReviewComponent';

  @override
  FDDriveReviewComponentState createState() => FDDriveReviewComponentState();
}

class FDDriveReviewComponentState extends State<FDDriveReviewComponent> {
  List<String> complementItems = ['Delivery time', 'Wrong location', 'Rude', 'Unprofessional'];

  int selectedComplementIndex = 0;

  TextEditingController feedbackController = TextEditingController();

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
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Drive Review', style: boldTextStyle()).center(),
              30.height,
              Container(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                decoration: boxDecorationRoundedWithShadow(8),
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage(FDHomeImage1), radius: 30),
                  title: Text('Ted Mosby', style: boldTextStyle()),
                  subtitle: Text('9856874523', style: primaryTextStyle(size: 14)),
                ),
              ),
              8.height,
              Container(
                decoration: boxDecorationRoundedWithShadow(8),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rate your delivery by Ted Mosby', style: primaryTextStyle(size: 14)),
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
                    Text('Give a Complement', style: primaryTextStyle(size: 14)),
                    8.height,
                    Wrap(
                      spacing: 8,
                      children: List.generate(complementItems.length, (index) {
                        return ChoiceChip(
                          label: Text('${complementItems[index]}'),
                          selected: selectedComplementIndex == index,
                          onSelected: (value) {
                            setState(() {
                              selectedComplementIndex = value ? index : null;
                            });
                          },
                          labelStyle: primaryTextStyle(
                            color: selectedComplementIndex == index ? FDSelectedTextColor : black,
                            size: 14,
                          ),
                          backgroundColor: grey.withOpacity(0.1),
                          selectedColor: FDSelectedTextColor.withOpacity(0.1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ).paddingBottom(8);
                      }),
                    ),
                    16.height,
                    Text('Share your feedback', style: primaryTextStyle(size: 14)),
                    8.height,
                    AppTextField(
                      controller: feedbackController,
                      textFieldType: TextFieldType.OTHER,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: grey.withOpacity(0.1),
                      ),
                      maxLines: 2,
                      autoFocus: false,
                    ),
                  ],
                ),
              ),
              16.height,
              fdAppButton(FDPrimaryColor, () {}, context, 'Submit'),
              16.height,
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
