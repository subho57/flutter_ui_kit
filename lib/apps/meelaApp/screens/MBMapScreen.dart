import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MBMapScreen extends StatefulWidget {
  static String tag = '/MBMapScreen';

  @override
  MBMapScreenState createState() => MBMapScreenState();
}

class MBMapScreenState extends State<MBMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  List<BudgetDetails> bankList = getBankList();

  static final CameraPosition _kGooglePlex = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

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

  Widget _scrollingList(ScrollController sc) {
    return ListView.separated(
      controller: sc,
      itemCount: bankList.length,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int i) {
        BudgetDetails data = bankList[i];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(data.icon, size: 22, color: appPrimaryColor),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.totalCost, style: boldTextStyle()),
                  8.height,
                  Text(data.budgetType, style: secondaryTextStyle(size: 14)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          minHeight: 250,
          color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          panelBuilder: (ScrollController sc) => _scrollingList(sc),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _goToTheLake,
          backgroundColor: appStore.isDarkModeOn ? appPrimaryColor : scaffoldColorDark,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
