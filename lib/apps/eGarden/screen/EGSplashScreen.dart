import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGStartingScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

bool isBack = false;

class EGSplashScreen extends StatefulWidget {
  static String tag = '/EGSplashScreen';

  @override
  EGSplashScreenState createState() => EGSplashScreenState();
}

class EGSplashScreenState extends State<EGSplashScreen> {
  PageController _pageController = PageController(initialPage: 0);
  double sizeOfContainer = 0.1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          centerTitle: true,
          title: Stack(
            children: [
              Container(
                width: context.width() * 0.7,
                height: 5,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: grey.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: context.width() * sizeOfContainer,
                height: 5,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1, borderRadius: BorderRadius.circular(16)),
              ),
            ],
          ),
        ),
        body: PageView(
          onPageChanged: (val) {
            if (isBack) {
              sizeOfContainer = sizeOfContainer - 0.1;
              setState(() {});
            } else {
              sizeOfContainer = sizeOfContainer + 0.1;
              setState(() {});
            }
          },
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CommonOnboardComponents(
              headingText: "Hello!",
              title: "Let's get your new smart garden set up.",
              subtitle: "For the next steps, make sure you have your wifi name and password handy.",
              btnText: "Next",
              index: 1,
              pageController: _pageController,
            ),
            CommonOnboardComponents(
              headingText: "Unbox Me",
              title: "Check components",
              subtitle: "Your smart garden package contains your garden, a package of sensors, sensors holder, Germination Domes and Power Adapter",
              btnText: "Confirm",
              index: 2,
              pageController: _pageController,
            ),
            CommonOnboardComponents(
              headingText: "Rise and Shine",
              title: "Wait for your device to fully turn on.",
              subtitle: "You'll know when the device's LED lights start pulsing white",
              btnText: "Next",
              index: 3,
              pageController: _pageController,
            ),
            CommonOnboardComponents(
              headingText: "Wifi Paring",
              title: "Connect to a Network",
              subtitle: "Next, we'll need to connect your device to the internet so we can update its firmware and active its smart garden features",
              btnText: "Next",
              index: 4,
              pageController: _pageController,
            ),
            WifiPairingComponents(pageController: _pageController, index: 5),
            CommonOnboardComponents(
              headingText: "Wifi Paring",
              title: "Now connect to your device's Wi-Fi",
              subtitle: "You can change the WiFi setting by tab on the button below or connect now",
              btnText: "Connect",
              index: 6,
              isWiFiSettingBtnEnable: true,
              pageController: _pageController,
            ),
            CommonOnboardComponents(
              headingText: "Done",
              title: "All Set!",
              subtitle: "Now, enjoy your new smart garden",
              btnText: "Done",
              index: 7,
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}

class CommonOnboardComponents extends StatelessWidget {
  final String headingText;
  final String image;
  final String title;
  final String subtitle;
  final String btnText;
  final int index;
  final bool isWiFiSettingBtnEnable;
  final PageController pageController;

  CommonOnboardComponents({
    Key key,
    this.isWiFiSettingBtnEnable = false,
    this.pageController,
    this.headingText,
    this.image,
    this.title,
    this.subtitle,
    this.btnText,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Wrap(
          children: [
            isWiFiSettingBtnEnable ? roundedButtonWithoutFillColor(context: context, btnText: "WiFi settings") : 0.height,
            roundedButtonWithFillColor(context: context, btnText: btnText).onTap(() {
              pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              isBack = false;
              if (index == 7) {
                finish(context);
                EGStartingScreen().launch(context);
              }
            }),
          ],
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headingText, style: boldTextStyle(size: 32)).paddingAll(16),
            32.height,
            Image.asset(EGFlowersImage, height: 250, width: 250).center(),
            8.height,
            Text(title, textAlign: TextAlign.center, style: secondaryTextStyle(size: 24, color: grey)),
            8.height,
            Text(subtitle, textAlign: TextAlign.center, style: secondaryTextStyle(color: grey)),
          ],
        ).center().paddingAll(16),
      ),
    );
  }
}

class WifiPairingComponents extends StatefulWidget {
  final int index;
  final PageController pageController;

  const WifiPairingComponents({Key key, this.index, this.pageController}) : super(key: key);

  @override
  _WifiPairingComponentsState createState() => _WifiPairingComponentsState();
}

class _WifiPairingComponentsState extends State<WifiPairingComponents> {
  FocusNode wifiNameFocus;
  FocusNode wifiPwdFocus;
  String selectType = "WPA2";
  bool isPasswordVisible = true;
  bool isPasswordIconVisible = false;
  bool isNextBtnEnable = false;
  TextEditingController _wifiNameController = TextEditingController();
  TextEditingController _wifiPwdController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    wifiNameFocus = FocusNode();
    wifiPwdFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    wifiNameFocus.dispose();
    wifiPwdFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        roundedButtonWithFillColor(context: context, btnText: "Next", isEnable: isNextBtnEnable).onTap(() {
          if (_formKey.currentState.validate()) {
            widget.pageController.animateToPage(widget.index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          }
          hideKeyboard(context);
          isBack = false;
        }),
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("WiFi Paring", style: boldTextStyle(size: 32)).paddingAll(16),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Please enter the details for your \nWiFi network", textAlign: TextAlign.start, style: secondaryTextStyle(color: grey)),
                    ],
                  ),
                  32.height,
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    focusNode: wifiNameFocus,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _wifiNameController,
                    style: primaryTextStyle(size: 18),
                    decoration: InputDecoration(
                      labelText: "Your Wi-Fi network's name",
                      contentPadding: EdgeInsets.zero,
                      labelStyle: secondaryTextStyle(size: 16),
                      enabledBorder: _wifiNameController.text.isEmptyOrNull ? null : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    ),
                    onFieldSubmitted: (val) {
                      wifiNameFocus.unfocus();
                      FocusScope.of(context).requestFocus(wifiPwdFocus);
                    },
                    onChanged: (val) {
                      isNextBtnEnable = _wifiNameController.text.isEmptyOrNull || _wifiPwdController.text.isEmptyOrNull ? false : true;
                      setState(() {});
                    },
                    validator: (val) {
                      if (val.isEmptyOrNull) {
                        return "Please enter wifi-name";
                      }
                      return null;
                    },
                  ),
                  8.height,
                  TextFormField(
                    focusNode: wifiPwdFocus,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _wifiPwdController,
                    style: primaryTextStyle(size: 18),
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: secondaryTextStyle(size: 16),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: isPasswordIconVisible
                          ? UnderlineInputBorder(
                              borderSide: BorderSide(color: gray, width: 1.5),
                            )
                          : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                      suffixIcon: isPasswordIconVisible
                          ? IconButton(
                              icon: isPasswordVisible ? Icon(Icons.visibility_off, color: appStore.isDarkModeOn ? appBarBackgroundColor : egPrimaryColor1) : Icon(Icons.visibility, color: egPrimaryColor1),
                              onPressed: () {
                                isPasswordVisible = !isPasswordVisible;
                                setState(() {});
                              })
                          : 0.width,
                      suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                    ),
                    onFieldSubmitted: (val) {
                      wifiPwdFocus.unfocus();
                    },
                    onChanged: (val) {
                      isNextBtnEnable = _wifiNameController.text.isEmptyOrNull || _wifiPwdController.text.isEmptyOrNull ? false : true;
                      isPasswordIconVisible = val.isEmptyOrNull ? false : true;
                      setState(() {});
                    },
                    validator: (val) {
                      if (val.isEmptyOrNull) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                  8.height,
                  Align(alignment: Alignment.centerLeft, child: Text("Security Type", style: secondaryTextStyle(size: 12))),
                  Container(
                    height: 50.0,
                    child: Theme(
                      data: Theme.of(context).copyWith(canvasColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor),
                      child: DropdownButton(
                        onTap: () {
                          hideKeyboard(context);
                        },
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: <String>["WPA2", "WPA", "WPA1"].map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item, style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black)),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            selectType = newValue;
                          });
                        },
                        value: selectType,
                      ),
                    ),
                  ),
                ],
              ).paddingAll(16),
            ),
          ],
        ),
      ),
    );
  }
}
