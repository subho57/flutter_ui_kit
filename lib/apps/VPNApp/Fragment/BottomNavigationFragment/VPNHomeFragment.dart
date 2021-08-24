import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/component/CirclePainter.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNSettingScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNDataProvider.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNHomeFragment extends StatefulWidget {
  static String tag = '/VPNHomeFragment';
  final double size;
  final Color color;

  VPNHomeFragment({this.size = 70, this.color = commonButtonColor});

  @override
  VPNHomeFragmentState createState() => VPNHomeFragmentState();
}

class VPNHomeFragmentState extends State<VPNHomeFragment> with TickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _circleRippleController;
  bool _vpnStart = false;
  String server = "Auto Server";

  String timer = "00\t:\t00\t:\t00";
  var swatch = Stopwatch();
  final duration = const Duration(seconds: 1);
  var count = 00;

  var getDrawerData = getDrawerList();

  void startTimer() {
    swatch.start();
    Timer(duration, keepRunning);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }
    setState(() {
      timer = swatch.elapsed.inHours.toString().padLeft(2, "0") + "\t:\t" + swatch.elapsed.inMinutes.toString().padLeft(2, "0") + "\t:\t" + count.toString();
      count++;
      if (count == 60) {
        count = 00;
      }
    });
  }

  void resetTimer() {
    swatch.stop();
    swatch.reset();
    count = 00;
    timer = "00\t:\t00\t:\t00";
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _circleRippleController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))..repeat();
    getStringAsync("countryName").isEmpty ? server = "Auto Server" : server = getStringAsync("countryName");
  }

  @override
  void dispose() {
    _circleRippleController?.dispose();
    removeKey("countryName");
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
        key: _scaffoldKey,
        backgroundColor: vpnBackgroundColor,
        drawer: Drawer(
          elevation: 6,
          child: SingleChildScrollView(
            child: Container(
              height: context.height(),
              color: vpnBackgroundColor,
              child: Column(
                children: [
                  Column(
                    children: getDrawerData.map((e) {
                      return Container(
                        color: commonBackgroundColor,
                        height: 60,
                        child: Row(
                          children: [
                            Text(e.title, style: TextStyle(color: commonColorWhite, fontSize: textSize)).expand(),
                            e.icon,
                          ],
                        ).paddingAll(8),
                      ).cornerRadiusWithClipRRect(8).paddingAll(8).onTap(() {
                        if (e.widget != null) {
                          finish(context);
                          e.widget.launch(context);
                        } else {
                          toast(e.title);
                          finish(context);
                        }
                      });
                    }).toList(),
                  ),
                  Container(
                    color: commonBackgroundColor,
                    height: 60,
                    child: Row(
                      children: [
                        Text("Logout", style: TextStyle(color: commonColorWhite, fontSize: textSize)).expand(),
                        Icon(Icons.logout, color: commonColorWhite, size: iconSize),
                      ],
                    ).paddingAll(8),
                  ).cornerRadiusWithClipRRect(8).paddingOnly(left: 8, right: 8, top: 8, bottom: 12),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: commonActionButton(icon: Icons.menu)),
                    Text("VPN", style: boldTextStyle(color: commonColorWhite, size: 26)),
                    GestureDetector(
                      onTap: () {
                        VPNSettingScreen().launch(context);
                      },
                      child: commonActionButton(icon: Icons.settings),
                    ),
                  ],
                ).paddingAll(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Connection With :\t", style: primaryTextStyle(color: commonColorWhite)),
                    Text(server, style: primaryTextStyle(color: commonColorWhite)),
                  ],
                ),
              ],
            ),
            32.height,
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: CirclePainter(_circleRippleController, color: widget.color),
                child: SizedBox(
                  width: widget.size * 4.0,
                  height: widget.size * 4.0,
                  child: vpnConnIndicator(),
                ),
              ).visible(_vpnStart),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /*Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), border: Border.all(color: commonBackBorderColor)),
                    child: Text(timer, style: boldTextStyle(color: commonColorWhite, size: 20)).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                  ).visible(_vpnStart),*/
                  16.height,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _vpnStart = !_vpnStart;
                        _vpnStart ? startTimer() : resetTimer();
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: !_vpnStart ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(64),
                        boxShadow: !_vpnStart ? [BoxShadow(color: Colors.white30, spreadRadius: 15, blurRadius: 20)] : null,
                      ),
                      child: Text(!_vpnStart ? "Start" : "Stop", style: boldTextStyle(color: commonColorWhite)).center(),
                    ),
                  ),
                ],
              ),
            ).center().paddingOnly(bottom: 8)
          ],
        ),
      ),
    );
  }

  Widget vpnConnIndicator() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [widget.color, Color.lerp(widget.color, Colors.black, 0.05)],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: _circleRippleController, curve: Curves.ease),
            ),
            child: Icon(
              Icons.security_rounded,
              size: 44,
              color: commonColorWhite,
            ),
          ),
        ),
      ),
    );
  }
}
