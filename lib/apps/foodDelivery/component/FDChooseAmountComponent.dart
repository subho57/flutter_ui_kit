import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDChooseAmountComponent extends StatefulWidget {
  static String tag = '/FDChooseAmountComponent';

  @override
  FDChooseAmountComponentState createState() => FDChooseAmountComponentState();
}

class FDChooseAmountComponentState extends State<FDChooseAmountComponent> {
  List<String> weightList = ['0.5 kg', '0.8 kg', '1 kg'];
  int selectedWeightIndex = 0;
  int selectedQuantity = 1;

  bool isCart = false;

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
    return Container(
      height: 350,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Choose amount', style: boldTextStyle()).center(),
              16.height,
              Text('Choose Weights', style: secondaryTextStyle(color: black)),
              Row(
                children: List.generate(weightList.length, (index) {
                  return ChoiceChip(
                    labelPadding: EdgeInsets.only(left: 16, right: 16),
                    selected: selectedWeightIndex == index,
                    label: Text(
                      weightList[index],
                      style: secondaryTextStyle(color: selectedWeightIndex == index ? FDSelectedTextColor : black),
                    ),
                    onSelected: (value) {
                      setState(() {
                        selectedWeightIndex = value ? index : null;
                      });
                    },
                    selectedColor: FDSelectedTextColor.withOpacity(0.2),
                    backgroundColor: grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ).paddingRight(16);
                }),
              ),
              16.height,
              Text('Choose Quantity', style: secondaryTextStyle(color: black)),
              8.height,
              Row(
                children: [
                  Container(
                    child: Text('-').paddingOnly(left: 10, right: 10, top: 4, bottom: 4),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: grey.withOpacity(0.1),
                    ),
                  ).onTap(() {
                    setState(() {
                      if (selectedQuantity > 1) {
                        selectedQuantity -= 1;
                      }
                    });
                  }),
                  16.width,
                  Text(selectedQuantity.toString(), style: secondaryTextStyle(color: black)),
                  16.width,
                  Container(
                    child: Text('+').paddingOnly(left: 10, right: 10, top: 4, bottom: 4),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: grey.withOpacity(0.1),
                    ),
                  ).onTap(() {
                    setState(() {
                      selectedQuantity += 1;
                    });
                  }),
                ],
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: fdAppButton(isCart ? FDRedColor : FDPrimaryColor, () {
              setState(() {
                isCart = !isCart;
              });
            }, context, isCart ? 'Remove Cart' : 'Add to Cart'),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                finish(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
