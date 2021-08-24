import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDFavouriteStoreProductComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDFavouritestoreVoucherComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyCartScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFavouriteStoreNextScreen extends StatefulWidget {
  static String tag = '/FDFavouriteStoreNextScreen';
  final String image;
  final String name;

  FDFavouriteStoreNextScreen({this.image, this.name});

  @override
  FDFavouriteStoreNextScreenState createState() => FDFavouriteStoreNextScreenState();
}

class FDFavouriteStoreNextScreenState extends State<FDFavouriteStoreNextScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            log(innerBoxIsScrolled);
            //TODO
            if (innerBoxIsScrolled) {
              setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
            } else {
              setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.light);
            }
            return [
              SliverAppBar(
                backgroundColor: FDPrimaryColor,
                expandedHeight: 250.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(widget.image, height: 200, fit: BoxFit.fill),
                ),
                leading: Icon(Icons.arrow_back_ios_outlined, color: white).onTap(() {
                  finish(context);
                }),
              ),
            ];
          },
          body: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  decoration: boxDecorationWithShadow(),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name, style: boldTextStyle()),
                        16.height,
                        TabBar(
                          tabs: [
                            Tab(text: 'Products'),
                            Tab(text: 'Voucher'),
                            Tab(text: 'About'),
                          ],
                          labelStyle: boldTextStyle(),
                          unselectedLabelStyle: primaryTextStyle(),
                          indicator: BoxDecoration(color: FDSelectedTextColor.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: FDSelectedTextColor,
                          unselectedLabelColor: grey,
                        ),
                      ],
                    ),
                  ),
                ),
                TabBarView(
                  children: [
                    FDFavouriteStoreProductComponent(),
                    FDFavouriteStoreVoucherComponent(),
                    Container(child: Center(child: Text('About'))),
                  ],
                ).expand(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          FDMarketIcon,
          width: 20,
          height: 20,
          color: white,
        ),
        backgroundColor: FDSecondaryColor,
        onPressed: () {
          FDMyCartScreen().launch(context);
        },
      ),
    );
  }
}
