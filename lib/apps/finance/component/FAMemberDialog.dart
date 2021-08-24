import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAVerifyIdentityScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FAMemberDialog extends StatefulWidget {
  static String tag = '/MemberDialog';

  @override
  FAMemberDialogState createState() => FAMemberDialogState();
}

class FAMemberDialogState extends State<FAMemberDialog> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(fa_congratulation_image, height: 180, width: 140, fit: BoxFit.fill),
              16.height,
              Text("Congratulations", style: boldTextStyle(color: fa_color_secondary)),
              16.height,
              Text('You are member now!', style: boldTextStyle(size: 18)),
              16.height,
              Text(fa_member_now, style: secondaryTextStyle(), textAlign: TextAlign.center),
              30.height,
              AppButton(
                color: fa_color_secondary,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text("I'm ready to start", style: TextStyle(color: Colors.white)),
                onTap: () {
                  finish(context);
                  FAVerifyIdentityScreen().launch(context);
                },
              )
            ],
          ).paddingOnly(top: 16, bottom: 16),
          Icon(Icons.close).onTap(() {
            finish(context);
          }).paddingOnly(top: 16, right: 16)
        ],
      ),
    );
  }
}
