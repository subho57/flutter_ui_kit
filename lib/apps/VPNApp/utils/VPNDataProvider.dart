import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/model/VPNModel.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNFAQScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNFeedbackAndSupportScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNSettingScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';

List<VPNModel> getDrawerList() {
  List<VPNModel> list = [];

  list.add(VPNModel(title: "Get Premium", icon: Icon(Icons.star_border_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(
      title: "Feedback and support",
      icon: Icon(
        Icons.feedback_outlined,
        color: commonColorWhite,
        size: iconSize,
      ),
      widget: VPNFeedbackAndSupportScreen()));
  list.add(VPNModel(title: "Like us on instagram", icon: Icon(Icons.thumb_up_outlined, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: "Invite your friends", icon: Icon(Icons.email_outlined, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: "Setting", icon: Icon(Icons.settings, color: commonColorWhite, size: iconSize), widget: VPNSettingScreen()));
  list.add(VPNModel(title: "FAQ", icon: Icon(Icons.help_outline_rounded, color: commonColorWhite, size: iconSize), widget: VPNFAQScreen()));

  return list;
}

List<VPNModel> getFeedbackAndSupportList() {
  List<VPNModel> list = [];

  list.add(VPNModel(title: 'Can\'t Connect', icon: Icon(Icons.close, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: 'Low Speed', icon: Icon(Icons.flash_on_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: 'Automatic Connection Termination', icon: Icon(Icons.wifi_off_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: 'Netflix/Hotstar/Streaming', icon: Icon(Icons.play_circle_outline_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: 'Membership Payment', icon: Icon(Icons.person, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: 'Other', icon: Icon(Icons.more_horiz_rounded, color: commonColorWhite, size: iconSize)));

  return list;
}

List<VPNModel> getFAQList() {
  List<VPNModel> list = [];

  list.add(VPNModel(title: 'It is safe?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));
  list.add(VPNModel(title: 'How to use $appName?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));
  list.add(VPNModel(title: 'How to disconnect $appName?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));
  list.add(VPNModel(title: 'Don\'t have authority / Can\'t press Ok to access website / apps?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));
  list.add(VPNModel(title: 'Can\'t find server you want?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));
  list.add(VPNModel(title: 'How to get more unlimited data?', icon: Icon(Icons.my_library_books_rounded, size: iconSize, color: commonColorWhite)));

  return list;
}

List<VPNModel> getPremiumList() {
  List<VPNModel> list = [];

  list.add(VPNModel(title: "Stable and 10 times higher speed", icon: Icon(Icons.check_circle_outline_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: "Watch HD video without freezing", icon: Icon(Icons.check_circle_outline_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: "Reach over 1000 Locations", icon: Icon(Icons.check_circle_outline_rounded, color: commonColorWhite, size: iconSize)));
  list.add(VPNModel(title: "Connect up to 5 different device", icon: Icon(Icons.check_circle_outline_rounded, color: commonColorWhite, size: iconSize)));

  return list;
}

List<VPNModel> getLocationList() {
  List<VPNModel> list = [];

  list.add(VPNModel(title: "Afghanistan", imageUrl: "https://flagpedia.net/data/flags/w702/af.png"));
  list.add(VPNModel(title: "Island", imageUrl: "https://flagpedia.net/data/flags/w702/ax.png"));
  list.add(VPNModel(title: "Albania", imageUrl: "https://flagpedia.net/data/flags/w702/al.png"));
  list.add(VPNModel(title: "Algeria", imageUrl: "https://flagpedia.net/data/flags/w702/dz.png"));
  list.add(VPNModel(title: "American Samoa", imageUrl: "https://flagpedia.net/data/flags/w702/as.png"));
  list.add(VPNModel(title: "Andorra", imageUrl: "https://flagpedia.net/data/flags/w702/ad.png"));
  list.add(VPNModel(title: "Argentina", imageUrl: "https://flagpedia.net/data/flags/w702/ar.png"));
  list.add(VPNModel(title: "Australia", imageUrl: "https://flagpedia.net/data/flags/w702/au.png"));
  list.add(VPNModel(title: "Bangladesh", imageUrl: "https://flagpedia.net/data/flags/w702/bd.png"));
  list.add(VPNModel(title: "Belgium", imageUrl: "https://flagpedia.net/data/flags/w702/be.png"));
  list.add(VPNModel(title: "Brazil", imageUrl: "https://flagpedia.net/data/flags/w702/br.png"));
  list.add(VPNModel(title: "Canada", imageUrl: "https://flagpedia.net/data/flags/w702/ca.png"));
  list.add(VPNModel(title: "China", imageUrl: "https://flagpedia.net/data/flags/w702/cn.png"));
  list.add(VPNModel(title: "England", imageUrl: "https://flagpedia.net/data/flags/w702/gb-eng.png"));
  list.add(VPNModel(title: "India", imageUrl: "https://flagpedia.net/data/flags/w702/in.png"));
  list.add(VPNModel(title: "Indonesia", imageUrl: "https://flagpedia.net/data/flags/w702/id.png"));
  list.add(VPNModel(title: "Iran", imageUrl: "https://flagpedia.net/data/flags/w702/ir.png"));
  list.add(VPNModel(title: "Iraq", imageUrl: "https://flagpedia.net/data/flags/w702/iq.png"));
  list.add(VPNModel(title: "Israel", imageUrl: "https://flagpedia.net/data/flags/w702/il.png"));
  list.add(VPNModel(title: "Italy", imageUrl: "https://flagpedia.net/data/flags/w702/it.png"));
  list.add(VPNModel(title: "Japan", imageUrl: "https://flagpedia.net/data/flags/w702/jp.png"));
  list.add(VPNModel(title: "Jordan", imageUrl: "https://flagpedia.net/data/flags/w702/jo.png"));
  list.add(VPNModel(title: "Kenya", imageUrl: "https://flagpedia.net/data/flags/w702/ke.png"));
  list.add(VPNModel(title: "North Korea", imageUrl: "https://flagpedia.net/data/flags/w702/kp.png"));
  list.add(VPNModel(title: "South Korea", imageUrl: "https://flagpedia.net/data/flags/w702/kr.png"));
  list.add(VPNModel(title: "Kuwait", imageUrl: "https://flagpedia.net/data/flags/w702/kw.png"));
  list.add(VPNModel(title: "Russia", imageUrl: "https://flagpedia.net/data/flags/w702/ru.png"));
  list.add(VPNModel(title: "South Africa", imageUrl: "https://flagpedia.net/data/flags/w702/za.png"));
  list.add(VPNModel(title: "Vietnam", imageUrl: "https://flagpedia.net/data/flags/w702/vn.png"));

  return list;
}
