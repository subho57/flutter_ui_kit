import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHRoomSearchComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHSearchScreen extends StatefulWidget {
  static String tag = '/RHSearchScreen';

  @override
  RHSearchScreenState createState() => RHSearchScreenState();
}

class RHSearchScreenState extends State<RHSearchScreen> {
  List<VerifiedRoomListModel> roomsList = getVerifiedRoomList();
  List<VerifiedRoomListModel> filterList = [];

  var searchController = TextEditingController();
  FocusNode searchNode = FocusNode();
  bool isClear = false;
  var searchText = "";
  bool isLoadingMoreData = false;
  bool isEmpty = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  fetchData() async {
    setState(() {
      roomsList.addAll(filterList);
    });
    roomsList.forEach((houseName) {
      if (houseName.houseName.toLowerCase().contains(searchText)) {
        filterList.add(houseName);
        isEmpty = false;
      } else {
        isEmpty = true;
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var searchList = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        filterList.isNotEmpty ? Text("Verified", style: boldTextStyle()).paddingOnly(left: 16, right: 16) : Container(),
        16.height,
        Container(
          height: 320,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 8, right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: filterList.length,
              itemBuilder: (context, index) {
                VerifiedRoomListModel mData = filterList[index];
                return Container(
                  width: 170,
                  margin: EdgeInsets.all(8),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), boxShadow: defaultBoxShadow()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(mData.img.validate(), height: 120, fit: BoxFit.cover),
                      ),
                      8.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('House No.${mData.houseNo.validate()}', style: secondaryTextStyle(color: Colors.grey)),
                          8.height,
                          Text(mData.houseName.validate(), style: boldTextStyle()),
                          8.height,
                          Text(mData.housePrice.validate(), style: boldTextStyle(color: appPrimaryColor, size: 14)),
                          6.height,
                          Text(mData.houseDescription.validate(), style: primaryTextStyle(size: 12, color: Colors.grey))
                        ],
                      ).paddingAll(8),
                    ],
                  ),
                );
              }),
        ),
        16.height,
        filterList.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Others rooms", style: boldTextStyle()),
                  Text("See more", style: boldTextStyle(size: 14, color: appPrimaryColor)),
                ],
              ).paddingOnly(left: 16, right: 16)
            : Container(),
        16.height,
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 8, right: 8),
          itemCount: filterList.length,
          itemBuilder: (context, index) {
            VerifiedRoomListModel mData = filterList[index];
            return Container(
              margin: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), boxShadow: defaultBoxShadow()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                    child: Image.asset(mData.img.validate(), height: 120, width: 120, fit: BoxFit.cover),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('House No.${mData.houseNo.validate()}', style: secondaryTextStyle(color: Colors.grey)),
                          Text(mData.housePrice.validate(), style: boldTextStyle(color: appPrimaryColor, size: 14)),
                        ],
                      ),
                      16.height,
                      Text(mData.houseName.validate(), style: boldTextStyle()),
                      8.height,
                      Text(mData.houseDescription.validate(), style: primaryTextStyle(size: 12, color: Colors.grey))
                    ],
                  ).paddingAll(8).expand(),
                ],
              ),
            );
          },
        )
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: boxDecorationRoundedWithShadow(26, backgroundColor: white),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: appPrimaryColor),
                  5.width,
                  Text("LA", style: boldTextStyle(color: appPrimaryColor)),
                  5.width,
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                  5.width,
                  Container(width: 1, height: 28, color: Colors.grey[300]),
                  5.width,
                  Container(
                    child: TextFormField(
                      focusNode: searchNode,
                      controller: searchController,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            isClear = true;
                            searchText = value;
                          } else {
                            isClear = false;
                            filterList.clear();
                            hideKeyboard(context);
                          }
                        });
                        fetchData();
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.close, color: Colors.grey).visible(isClear).onTap(() {
                          searchController.clear();
                          filterList.clear();
                          isClear = false;
                          isEmpty = false;
                          hideKeyboard(context);
                        }),
                        border: InputBorder.none,
                        hintText: "Find district, street name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ).expand(),
                ],
              ).paddingOnly(left: 8, right: 8),
            ).expand(),
            5.width,
            filterList.isNotEmpty
                ? Container(
                    height: 45,
                    width: 45,
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(30), boxShadow: defaultBoxShadow()),
                    child: Icon(Icons.filter_alt, color: appPrimaryColor),
                  ).onTap(() {
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return RHRoomSearchComponent();
                      },
                    );
                  })
                : Container()
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 8, top: 16),
        physics: ClampingScrollPhysics(),
        children: [
          isEmpty == false
              ? searchList
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      80.height,
                      Text("No results found for \"" + searchController.text, style: primaryTextStyle()),
                      Text("Try a different keyword", style: primaryTextStyle()),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
