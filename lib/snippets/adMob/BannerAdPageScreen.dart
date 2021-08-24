import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class BannerAdPageScreen extends StatefulWidget {
  static String tag = '/BannerAdPageScreen';

  @override
  BannerAdPageScreenState createState() => BannerAdPageScreenState();
}

class BannerAdPageScreenState extends State<BannerAdPageScreen> {
  BannerAd myBanner;

  BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: Foundation.kDebugMode ? BannerAd.testAdUnitId : BannerId,
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (event) {
          //
        },
      ),
      request: AdRequest(),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    myBanner = buildBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScroller(
        title: 'Banner Ad',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text('BannerAd Page', style: boldTextStyle(size: 16, color: black)),
              Container(width: context.width(), height: AdSize.banner.height.toDouble(), child: AdWidget(ad: myBanner)),
            ],
          ),
        ),
      ),
    );
  }
}
