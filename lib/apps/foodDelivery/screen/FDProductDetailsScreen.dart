import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyCartScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSearchScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDProductDetailsScreen extends StatefulWidget {
  static String tag = '/FDProductDetailsScreen';
  final FDFavouriteStoreProductsModel data;

  FDProductDetailsScreen({this.data});

  @override
  FDProductDetailsScreenState createState() => FDProductDetailsScreenState();
}

class FDProductDetailsScreenState extends State<FDProductDetailsScreen> {
  List<String> weightList = ['0.5 kg', '0.8 kg', '1 kg'];
  List<FDFavouriteStoreProductsModel> productItems = fdGetFavouriteStoreProductsItems();

  int selectedWeightIndex = 0;
  String selectedWeight = '';
  int selectedQuantity = 1;

  bool isCart = false;

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
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(
        title: 'Product Details',
        context: context,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              FDSearchScreen().launch(context);
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: ImageIcon(AssetImage(FDMarketIcon)),
                onPressed: () {
                  FDMyCartScreen().launch(context);
                },
              ),
              Positioned(
                right: 6,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                  child: Text('1'),
                ),
              )
            ],
          ).center().paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: boxDecorationWithShadow(),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        widget.data.image,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ).center(),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.data.name, style: boldTextStyle()),
                          Row(
                            children: [
                              Text('\$${widget.data.price}', style: boldTextStyle()),
                              Text('/${widget.data.perPriceName}', style: secondaryTextStyle(color: black)),
                            ],
                          ),
                        ],
                      ),
                      16.height,
                      Text(widget.data.details, textAlign: TextAlign.justify, style: secondaryTextStyle(color: black)),
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
                                selectedWeight = value ? weightList[index] : null;
                                log('selected weight:$selectedWeight');
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
                  ).paddingAll(16),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: widget.data.isFavourite
                        ? IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.red.withOpacity(0.5),
                            onPressed: () {
                              setState(() {
                                widget.data.isFavourite = !widget.data.isFavourite;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.favorite_outline),
                            onPressed: () {
                              setState(() {
                                widget.data.isFavourite = !widget.data.isFavourite;
                              });
                            },
                          ),
                  ),
                ],
              ),
            ),
            16.height,
            Text('Related Products', style: boldTextStyle()).paddingLeft(16),
            Container(
              height: 230,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productItems.length,
                itemBuilder: (context, index) {
                  FDFavouriteStoreProductsModel mData = productItems[index];

                  return Container(
                    decoration: boxDecorationRoundedWithShadow(8),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(mData.image, height: 100, width: 120, fit: BoxFit.fill),
                              4.height,
                              Text(mData.name, style: primaryTextStyle()),
                              4.height,
                              Row(
                                children: [
                                  Text('\$${mData.price}', style: boldTextStyle()),
                                  Text('/${mData.perPriceName}', style: secondaryTextStyle(color: black)),
                                ],
                              ),
                            ],
                          ).paddingOnly(left: 16, right: 16),
                        ),
                        Positioned(
                          left: 16,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mData.discount != null
                                  ? Container(
                                      color: FDRedColor,
                                      child: Text('${mData.discount}%', style: secondaryTextStyle(color: white)),
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                    )
                                  : Text(''),
                              mData.isFavourite
                                  ? IconButton(
                                      icon: Icon(Icons.favorite),
                                      color: Colors.red.withOpacity(0.5),
                                      onPressed: () {
                                        setState(() {
                                          mData.isFavourite = !mData.isFavourite;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.favorite_outline),
                                      onPressed: () {
                                        setState(() {
                                          mData.isFavourite = !mData.isFavourite;
                                        });
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingRight(16).onTap(() {
                    FDProductDetailsScreen(data: mData).launch(context);
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: fdAppButton(isCart ? FDRedColor : FDPrimaryColor, () {
        setState(() {
          isCart = !isCart;
        });
      }, context, isCart ? 'Remove Cart' : 'Add to Cart')
          .paddingAll(16),
    );
  }
}
