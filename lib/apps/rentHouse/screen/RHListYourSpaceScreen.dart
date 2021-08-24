import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHAddressComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHConfirmationComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHInformationComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHUtilitiesComponent.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHListYourSpaceScreen extends StatefulWidget {
  static String tag = '/RHListYourSpaceScreen';

  @override
  RHListYourSpaceScreenState createState() => RHListYourSpaceScreenState();
}

class RHListYourSpaceScreenState extends State<RHListYourSpaceScreen> {
  int currentStep = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var depositController = TextEditingController();
  var electricityController = TextEditingController();
  var waterController = TextEditingController();
  var internetController = TextEditingController();
  FocusNode depositNode = FocusNode();
  FocusNode electricityNode = FocusNode();
  FocusNode waterNode = FocusNode();
  FocusNode internetNode = FocusNode();
  bool electricityCheckBox = false;
  bool waterCheckBox = false;
  bool internetCheckBox = false;
  bool isParking = false;

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
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
            onPressed: () {
              finish(context);
            }),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("List your space", style: boldTextStyle(size: 16)),
      ),
      body: Theme(
        data: ThemeData(
          primarySwatch: MaterialColor(0xFF4C76EA, color),
          canvasColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          appBarTheme: AppBarTheme(elevation: 0),
        ),
        child: Stepper(
          type: StepperType.horizontal,
          physics: ClampingScrollPhysics(),
          controlsBuilder: (context, {onStepCancel, onStepContinue}) {
            return Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  AppButton(
                    height: 40,
                    color: appPrimaryColor,
                    child: Text('Cancel', style: boldTextStyle(size: 14, color: white)),
                    onTap: () {
                      if (currentStep > 0) {
                        setState(() {
                          currentStep -= 1;
                        });
                      } else {
                        currentStep = 0;
                        finish(context);
                      }
                    },
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(12)),
                  ),
                  AppButton(
                    height: 40,
                    color: appPrimaryColor,
                    child: Text('Next', style: boldTextStyle(size: 14, color: white)),
                    onTap: () {
                      if (currentStep < 3) {
                        setState(() {
                          currentStep += 1;
                          if (currentStep == 3) {
                            finish(context);
                          }
                        });
                      } else {
                        currentStep = 0;
                      }
                    },
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(12)),
                  ),
                ],
              ),
            );
          },
          steps: [
            Step(
              title: Text("Information", textAlign: TextAlign.center, style: secondaryTextStyle(size: 11)),
              content: Container(child: RHInformationComponent()),
              isActive: currentStep >= 0,
              state: currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text("Address", textAlign: TextAlign.center, style: secondaryTextStyle(size: 11)),
              content: Container(child: RHAddressComponent()),
              isActive: currentStep >= 0,
              state: currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text("Utilities", textAlign: TextAlign.center, style: secondaryTextStyle(size: 11)),
              content: Container(child: RHUtilitiesComponent()),
              isActive: currentStep >= 0,
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text("Information", textAlign: TextAlign.center, style: secondaryTextStyle(size: 11)),
              content: Container(child: RHConfirmationComponent()),
              isActive: currentStep >= 0,
              state: currentStep >= 3 ? StepState.complete : StepState.disabled,
            ),
          ],
          currentStep: currentStep,
          onStepTapped: (step) {
            currentStep = step;
          },
        ),
      ),
    );
  }

  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  Widget internetStepper() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deposit", style: secondaryTextStyle(size: 16)),
            8.height,
            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: Colors.grey[100]),
              child: AppTextField(
                controller: depositController,
                textFieldType: TextFieldType.OTHER,
                focus: depositNode,
                autoFocus: false,
                nextFocus: electricityNode,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter deposit",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            16.height,
            Text("Electricity", style: secondaryTextStyle(size: 16)),
            8.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: Colors.grey[100]),
                  child: AppTextField(
                    controller: electricityController,
                    textFieldType: TextFieldType.OTHER,
                    focus: electricityNode,
                    autoFocus: false,
                    nextFocus: waterNode,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter electricity",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ).expand(),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                  ),
                  child: Checkbox(
                    activeColor: appPrimaryColor,
                    value: electricityCheckBox,
                    onChanged: (value) {
                      setState(() {
                        electricityCheckBox = !electricityCheckBox;
                      });
                    },
                  ),
                ),
                Text("Free")
              ],
            ),
            16.height,
            Text("Water", style: secondaryTextStyle(size: 16)),
            8.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: Colors.grey[100]),
                  child: AppTextField(
                    controller: waterController,
                    textFieldType: TextFieldType.OTHER,
                    focus: waterNode,
                    autoFocus: false,
                    nextFocus: internetNode,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Water cost",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ).expand(),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                  ),
                  child: Checkbox(
                    activeColor: appPrimaryColor,
                    value: waterCheckBox,
                    onChanged: (value) {
                      setState(() {
                        waterCheckBox = !waterCheckBox;
                      });
                    },
                  ),
                ),
                Text("Free")
              ],
            ),
            16.height,
            Text("Internet", style: secondaryTextStyle(size: 16)),
            8.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: Colors.grey[100]),
                  child: AppTextField(
                    controller: internetController,
                    textFieldType: TextFieldType.OTHER,
                    focus: internetNode,
                    autoFocus: false,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Internet cost",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ).expand(),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                  ),
                  child: Checkbox(
                    activeColor: appPrimaryColor,
                    value: internetCheckBox,
                    onChanged: (value) {
                      setState(() {
                        internetCheckBox = !internetCheckBox;
                      });
                    },
                  ),
                ),
                Text("Free")
              ],
            ),
            16.height,
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                  ),
                  child: Checkbox(
                    activeColor: appPrimaryColor,
                    value: isParking,
                    onChanged: (value) {
                      setState(() {
                        isParking = !isParking;
                      });
                    },
                  ),
                ),
                Text("Is there space for parking?", style: secondaryTextStyle(size: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
