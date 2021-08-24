import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/snippets/adMob/BannerAdPageScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class AdMobScreen extends StatefulWidget {
  static String tag = '/AdMobScreen';

  @override
  AdMobScreenState createState() => AdMobScreenState();
}

class AdMobScreenState extends State<AdMobScreen> {
  InterstitialAd myInterstitial;
  RewardedAd videoAd;

  int coins = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    myInterstitial = buildInterstitialAd()..load();

    videoAd = RewardedAd(
      listener: AdListener(onRewardedAdUserEarnedReward: (_, rewardAmount) {
        coins += rewardAmount.amount;

        setState(() {});
      }),
      request: AdRequest(),
      adUnitId: Foundation.kDebugMode ? RewardedAd.testAdUnitId : RewardedId,
    );

    videoAd.load();
  }

  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: Foundation.kDebugMode ? InterstitialAd.testAdUnitId : InterstitialId,
      listener: AdListener(onAdLoaded: (event) {
        myInterstitial..load();
        print(event);
      }, onAdClosed: (ad) {
        myInterstitial = buildInterstitialAd()..load();
      }),
      request: AdRequest(),
    );
  }

  void showInterstitialAd() {
    myInterstitial?.show();
  }

  @override
  void dispose() {
    myInterstitial?.dispose();
    videoAd?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('BannerAd', style: boldTextStyle(size: 14)),
              onTap: () {
                BannerAdPageScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
            ),
            8.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('InterstitialAd', style: boldTextStyle(size: 14)),
              onTap: () {
                showInterstitialAd();
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
            ),
            8.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('Rewarded Ads', style: boldTextStyle(size: 14)),
              onTap: () async {
                if (await videoAd.isLoaded()) {
                  await videoAd.show();
                }
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            30.height,
            Text("You have $coins coins", style: boldTextStyle()),
          ],
        ).center(),
      ),
    );
  }
}
