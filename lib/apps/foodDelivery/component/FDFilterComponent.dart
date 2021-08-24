import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFilterComponent extends StatefulWidget {
  static String tag = '/FDFilterComponent';

  @override
  FDFilterComponentState createState() => FDFilterComponentState();
}

class FDFilterComponentState extends State<FDFilterComponent> {
  List<String> optionsList = ['Delivery', 'Pickup'];
  List<IconData> optionsIconList = [Icons.delivery_dining, Icons.wheelchair_pickup];
  List<String> typeList = ['Fast food', 'Pizza', 'Cake & Bakery', 'Snacks', 'Deserts', 'Thai food'];
  List<String> ratingList = ['\$', '\$\$', '\$\$\$'];

  int selectedOption = 0;
  int selectedRating = 0;
  int selectedRating$ = 0;
  int selectedType = 0;
  double selectedDistance = 0;

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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Filter', style: boldTextStyle()).center(),
              16.height,
              Text('Options', style: primaryTextStyle(size: 14)),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(optionsList.length, (index) {
                  return ChoiceChip(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(optionsIconList[index], color: selectedOption == index ? FDSelectedTextColor : black),
                        8.width,
                        Text(
                          optionsList[index],
                        ),
                      ],
                    ),
                    labelPadding: EdgeInsets.only(left: 16, right: 16),
                    labelStyle: primaryTextStyle(size: 14, color: selectedOption == index ? FDSelectedTextColor : black),
                    selected: selectedOption == index,
                    onSelected: (value) {
                      setState(() {
                        selectedOption = value ? index : null;
                      });
                    },
                    selectedColor: FDSelectedTextColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: grey.withOpacity(0.1),
                  );
                }),
              ),
              16.height,
              Text('Rating', style: primaryTextStyle(size: 14)),
              8.height,
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: List.generate(5, (index) {
                  return ChoiceChip(
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${index + 1}'),
                        4.width,
                        Icon(Icons.star, color: selectedType == index ? FDSelectedTextColor : black, size: 20),
                      ],
                    ),
                    labelStyle: primaryTextStyle(size: 14, color: selectedType == index ? FDSelectedTextColor : black),
                    selected: selectedType == index,
                    onSelected: (value) {
                      setState(() {
                        selectedType = value ? index : null;
                      });
                    },
                    selectedColor: FDSelectedTextColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: grey.withOpacity(0.1),
                  );
                }),
              ),
              16.height,
              Text('Rating', style: primaryTextStyle(size: 14)),
              8.height,
              Row(
                children: List.generate(ratingList.length, (index) {
                  return ChoiceChip(
                    label: Text(ratingList[index]),
                    labelPadding: EdgeInsets.only(left: 16, right: 16),
                    labelStyle: primaryTextStyle(size: 14, color: selectedRating$ == index ? FDSelectedTextColor : black),
                    selected: selectedRating$ == index,
                    onSelected: (value) {
                      setState(() {
                        selectedRating$ = value ? index : null;
                      });
                    },
                    selectedColor: FDSelectedTextColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: grey.withOpacity(0.1),
                  ).paddingRight(8);
                }),
              ),
              16.height,
              Text('Type', style: primaryTextStyle(size: 14)),
              8.height,
              Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: List.generate(typeList.length, (index) {
                  return ChoiceChip(
                    label: Text(typeList[index]),
                    labelStyle: primaryTextStyle(size: 14, color: selectedRating == index ? FDSelectedTextColor : black),
                    selected: selectedRating == index,
                    onSelected: (value) {
                      setState(() {
                        selectedRating = value ? index : null;
                      });
                    },
                    selectedColor: FDSelectedTextColor.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: grey.withOpacity(0.1),
                  ).paddingBottom(8);
                }),
              ),
              16.height,
              Text('Distance', style: primaryTextStyle(size: 14)),
              Slider(
                value: selectedDistance,
                onChanged: (value) {
                  setState(() {
                    selectedDistance = value;
                  });
                },
                activeColor: FDSelectedTextColor,
                inactiveColor: grey.withOpacity(0.2),
                label: '${selectedDistance.round()} km',
                min: 0,
                max: 100,
                divisions: 10,
              ),
              16.height,
              fdAppButton(FDPrimaryColor, () {
                finish(context);
              }, context, 'Submit'),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 16),
          Positioned(
            right: 16,
            top: 16,
            child: Icon(Icons.close).onTap(() {
              finish(context);
            }),
          ),
        ],
      ),
    );
  }
}
