import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';

List<EGModel> getPlants() {
  List<EGModel> _plantModel = [];
  _plantModel.add(
    EGModel(
      title: "Allanthus",
      isCart: true,
      type: "Ferns",
      price: 14,
      subtitle: "10 Days",
      image: EGImgPot01,
      textColor: pinkColor,
      darkColor: darkPink,
      lightColor: lightPink,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Excelsa",
      price: 14,
      type: "Succulents",
      subtitle: "12 Days",
      image: EGImgPot02,
      textColor: blueColor,
      darkColor: darkBlue,
      lightColor: lightBlue,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Prometheus",
      isCart: true,
      price: 14,
      type: "Herbs",
      subtitle: "9 Days",
      image: EGImgPot03,
      textColor: greenColor,
      darkColor: darkGreen,
      lightColor: lightGreen,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Convenant",
      price: 14,
      subtitle: "8 Days",
      type: "Tree",
      image: EGImgPot07,
      textColor: tealColor,
      darkColor: darkTeal,
      lightColor: lightTeal,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Fruticosa",
      isCart: true,
      price: 14,
      type: "Herbs",
      subtitle: "15 Days",
      image: EGImgPot05,
      textColor: purpleColor,
      darkColor: darkPurple,
      lightColor: lightPurple,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Mikacosa",
      price: 14,
      type: "Succulents",
      subtitle: "25 Days",
      image: EGImgPot06,
      textColor: greyColor,
      darkColor: darkGrey,
      lightColor: lightGrey,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Allanthus",
      isCart: true,
      type: "Herbs",
      price: 14,
      subtitle: "10 Days",
      image: EGImgPot01,
      textColor: pinkColor,
      darkColor: darkPink,
      lightColor: lightPink,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Convenant",
      price: 14,
      subtitle: "8 Days",
      type: "Succulents",
      image: EGImgPot07,
      textColor: tealColor,
      darkColor: darkTeal,
      lightColor: lightTeal,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Fruticosa",
      isCart: true,
      price: 14,
      type: "Ferns",
      subtitle: "15 Days",
      image: EGImgPot05,
      textColor: purpleColor,
      darkColor: darkPurple,
      lightColor: lightPurple,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Mikacosa",
      price: 14,
      type: "Ferns",
      subtitle: "25 Days",
      image: EGImgPot06,
      textColor: greyColor,
      darkColor: darkGrey,
      lightColor: lightGrey,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Prometheus",
      isCart: true,
      price: 14,
      type: "Tree",
      subtitle: "9 Days",
      image: EGImgPot03,
      textColor: greenColor,
      darkColor: darkGreen,
      lightColor: lightGreen,
    ),
  );
  _plantModel.add(
    EGModel(
      title: "Fruticosa",
      isCart: true,
      price: 14,
      type: "Tree",
      subtitle: "15 Days",
      image: EGImgPot05,
      textColor: purpleColor,
      darkColor: darkPurple,
      lightColor: lightPurple,
    ),
  );
  return _plantModel;
}

List<EGLanguageModel> getLanguages() {
  List<EGLanguageModel> _langModel = [];
  _langModel.add(EGLanguageModel(language: "English", image: EGIconUS, isSelect: true));
  _langModel.add(EGLanguageModel(language: "Francais", image: EGIconFrance));
  _langModel.add(EGLanguageModel(language: "Italiano", image: EGIconItaly));
  return _langModel;
}

List<EGOrderPackageModel> getOrderPackages() {
  List<EGOrderPackageModel> _orderPackage = [];
  _orderPackage.add(EGOrderPackageModel(packageName: "Package 1", isDetails: true, noOfItem: 4, image: EGIconPlants));
  _orderPackage.add(EGOrderPackageModel(packageName: "Package 2", isDetails: true, noOfItem: 1, image: EGIconFertilizer));
  _orderPackage.add(EGOrderPackageModel(packageName: "Package 3", isPreparing: true, noOfItem: 3, image: EGIconFlowers));
  _orderPackage.add(EGOrderPackageModel(packageName: "Package 4", isShipping: true, noOfItem: 7, image: EGIconFertilizer));
  return _orderPackage;
}
