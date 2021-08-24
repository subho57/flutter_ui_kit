import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/component/HMBookingAppointmentComponent.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMConfirmBooking.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMBookingAppointmentScreen extends StatefulWidget {
  static String tag = '/HMBookingAppointmentScreen';

  @override
  HMBookingAppointmentScreenState createState() => HMBookingAppointmentScreenState();
}

class HMBookingAppointmentScreenState extends State<HMBookingAppointmentScreen> {
  PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          centerTitle: true,
          elevation: 0,
          title: Text("Booking Appointment", style: boldTextStyle(size: 22)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Column(
              children: [
                createRichText(list: [
                  TextSpan(text: "Total Price : ", style: boldTextStyle(color: HMFontColor400)),
                  TextSpan(text: "\$45", style: boldTextStyle(color: hmColorPrimary)),
                ]),
                8.height,
                Text("Steps ${pageIndex + 1} / 10", style: TextStyle(color: HMFontColor400)),
                8.height
              ],
            ),
          ),
        ),
        body: Container(
          height: context.height(),
          child: Stack(
            children: [
              Container(
                height: context.height() * 0.75,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    if (pageIndex < index) {
                      ++pageIndex;
                    } else if (pageIndex > index) {
                      --pageIndex;
                    }
                    setState(() {});
                  },
                  children: [
                    HMBookAppointmentStep1(pageIndex),
                    HMBookAppointmentStep2(pageIndex),
                    HMBookAppointmentStep3(pageIndex),
                    HMBookAppointmentStep4(pageIndex),
                    HMBookAppointmentStep5(pageIndex),
                    HMBookAppointmentStep6(pageIndex),
                    HMBookAppointmentStep7(pageIndex),
                    HMBookAppointmentStep8(pageIndex),
                    HMBookAppointmentStep9(pageIndex),
                    HMBookAppointmentStep10(pageIndex),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: pageIndex == 9
                    ? CommonButton("Complete").onTap(() {
                        finish(context);
                        HMConfirmBookingScreen().launch(context);
                      })
                    : CommonButton("Next").onTap(
                        () {
                          _pageController.animateToPage(++pageIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInOutQuad);
                          setState(() {});
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
