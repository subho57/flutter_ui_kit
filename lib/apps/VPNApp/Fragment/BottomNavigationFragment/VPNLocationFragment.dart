import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/model/VPNModel.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNDataProvider.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNLocationFragment extends StatefulWidget {
  static String tag = '/VPNLocationFragment';

  @override
  VPNLocationFragmentState createState() => VPNLocationFragmentState();
}

class VPNLocationFragmentState extends State<VPNLocationFragment> {
  bool _isExpand = false;
  int selectedLocation;
  var getLocationData = getLocationList();
  TextEditingController searchController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: vpnBackgroundColor,
        body: Column(
          children: [
            !_isExpand
                ? Row(
                    children: [
                      Text("Virtual Location", style: boldTextStyle(color: commonColorWhite, size: 26)).expand(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpand = !_isExpand;
                          });
                        },
                        child: commonActionButton(icon: Icons.search_rounded),
                      ),
                    ],
                  ).paddingAll(16)
                : Container(
                    decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.search_rounded, size: 26, color: commonColorWhite), onPressed: null),
                        TextField(
                          autofocus: true,
                          controller: searchController,
                          onChanged: (value) {
                            filterSearchLocation(value);
                          },
                          style: TextStyle(color: commonColorWhite, fontSize: 20),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.clear, color: commonColorWhite, size: 26),
                                  onPressed: () {
                                    setState(() {
                                      _isExpand = !_isExpand;
                                      searchController.clear();
                                      filterSearchLocation(searchController.text);
                                    });
                                  }),
                              border: InputBorder.none,
                              hintText: "Enter Location",
                              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 20)),
                        ).expand()
                      ],
                    ),
                  ).paddingAll(16),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("All Location", style: boldTextStyle(color: commonColorWhite, size: 18)).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                  Column(
                    children: getLocationData
                        .asMap()
                        .map(
                          (e, data) {
                            return MapEntry(
                              e,
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: selectedLocation == e ? Colors.white54 : null, border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(width: 50, height: 50, child: Image.network(data.imageUrl, fit: BoxFit.cover)).cornerRadiusWithClipRRect(32),
                                    16.width,
                                    Text(data.title, style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite))
                                  ],
                                ),
                              ).onTap(() {
                                setState(() {
                                  selectedLocation = e;
                                  setValue("countryName", data.title);
                                });
                              }).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                            );
                          },
                        )
                        .values
                        .toList(),
                  ),
                ],
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }

  void filterSearchLocation(String query) {
    List<VPNModel> searchList = [];
    searchList.addAll(getLocationData);
    if (query.isNotEmpty) {
      List<VPNModel> dummyListData = [];
      searchList.forEach(
        (element) {
          if (element.title.contains(query)) {
            dummyListData.add(element);
          }
        },
      );
      getLocationData.clear();
      getLocationData.addAll(dummyListData);
      setState(() {});
      return;
    } else {
      getLocationData.clear();
      getLocationData.addAll(getLocationList());
      setState(() {});
    }
  }
}
