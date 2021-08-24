import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHRoomDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class RHAuthenticationRoomComponent extends StatelessWidget {
  final List<AuthenticateRoomModel> authenticationRoomList = getAuthenticateRoomList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
        mainAxisSpacing: 8,
      ),
      itemCount: authenticationRoomList.length,
      itemBuilder: (context, index) {
        AuthenticateRoomModel mData = authenticationRoomList[index];
        return GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            child: Image.asset(mData.image, fit: BoxFit.fill, height: 120, width: 120),
          ),
          onTap: () {
            RHRoomDetailsScreen(image: mData.image).launch(context);
          },
        );
      },
    );
  }
}
