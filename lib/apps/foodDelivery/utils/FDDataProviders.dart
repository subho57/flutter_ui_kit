import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:nb_utils/nb_utils.dart';

List<FDHomeItemModel> fdGetHomeItems() {
  List<FDHomeItemModel> homeItemList = [];
  homeItemList.add(FDHomeItemModel(image: FDHomeImage1, name: 'Foods'));
  homeItemList.add(FDHomeItemModel(image: FDHomeImage2, name: 'Fruits'));
  homeItemList.add(FDHomeItemModel(image: FDHomeImage3, name: 'Vegetables'));
  return homeItemList;
}

List<FDPopularItemModel> fdGetPopularItems() {
  List<FDPopularItemModel> popularItemList = [];
  popularItemList.add(
    FDPopularItemModel(
        image: FDRiceImage,
        name: 'Rice',
        price: 20,
        isCart: false,
        isFavourite: false,
        discount: 20,
        salePrice: 15,
        quantity: 2,
        description:
            'Rice, (Oryza sativa), edible starchy cereal grain and the grass plant (family Poaceae) by which it is produced. ... Rice is cooked by boiling, or it can be ground into a flour. It is eaten alone and in a great variety of soups, side dishes, and main dishes in Asian, Middle Eastern, and many other cuisines.'),
  );
  popularItemList.add(
    FDPopularItemModel(
        image: FDNoodlesImage,
        name: 'Noodles',
        price: 30,
        isCart: false,
        isFavourite: true,
        quantity: 1,
        description:
            'Noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings. ... Noodles are usually cooked in boiling water, sometimes with cooking oil or salt added.'),
  );
  popularItemList.add(
    FDPopularItemModel(
        image: FDPanirImage,
        name: 'Paneer',
        price: 50,
        isCart: false,
        isFavourite: false,
        quantity: 2,
        description:
            'Paneer (pronounced [pəniːr]) or Indian cottage cheese is a fresh cheese common in the Indian subcontinent (India, Pakistan, Bangladesh) made from cow or buffalo milk. It is a non-aged, non-melting soft cheese made by curdling milk with a fruit- or vegetable-derived acid, such as lemon juice.'),
  );
  popularItemList.add(FDPopularItemModel(
    name: 'Snacks',
    image: FDSnackImage,
    price: 3,
    isFavourite: true,
    isCart: false,
    quantity: 3,
    description:
        'A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods and other processed foods, as well as items made from fresh ingredients at home. ... Snack foods are typically designed to be portable, quick, and satisfying.',
  ));
  popularItemList.add(FDPopularItemModel(
    name: 'Hamburger',
    image: FDHamburgerImage,
    price: 6,
    isFavourite: false,
    isCart: false,
    quantity: 1,
    description:
        'A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.',
  ));
  popularItemList.add(FDPopularItemModel(
    name: 'Pizza',
    image: FDPizzaImage,
    price: 9,
    isFavourite: true,
    isCart: false,
    quantity: 1,
    description:
        'Pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ...',
  ));
  popularItemList.add(FDPopularItemModel(
    name: 'Beef Noodle',
    image: FDBeefNoodleImage,
    price: 5,
    isFavourite: true,
    isCart: false,
    quantity: 3,
    description:
        'Beef noodle soup is a noodle soup made of stewed or red braised beef, beef broth, vegetables and Chinese noodles. It exists in various forms throughout East and Southeast Asia. ... Beef noodles are often served with suan cai (Chinese sauerkraut) on top, green onion and sometimes other vegetables in the soup as well.',
  ));
  popularItemList.add(
    FDPopularItemModel(
      image: FDDriedFoodImage,
      name: 'Dried Foods',
      price: 20,
      salePrice: 17,
      discount: 20,
      isFavourite: false,
      isCart: false,
      quantity: 3,
      description:
          'Drying is the world\'s oldest and most common method of food preservation. Drying technology is both simple and readily available to most of the world\'s culture. Examples of dried foods are jerky, powdered milk, dried beans and peas, potatoes in a box, dried fruits and vegetables, pasta, and rice.',
    ),
  );
  return popularItemList;
}

List<FDCollectionsItemModel> fdGetCollectionsItems() {
  List<FDCollectionsItemModel> collectionsItemList = [];
  collectionsItemList.add(FDCollectionsItemModel(image: FDSuperDealCollectionImage, name: 'Super Deal'));
  collectionsItemList.add(FDCollectionsItemModel(image: FDFriendShipCollectionImage, name: 'Friendship'));
  collectionsItemList.add(FDCollectionsItemModel(image: FDSuperDealCollectionImage, name: 'Super Deal'));
  collectionsItemList.add(FDCollectionsItemModel(image: FDFriendShipCollectionImage, name: 'Friendship'));
  return collectionsItemList;
}

List<FDCategoriesItemModel> fdGetCategoriesItems() {
  List<FDCategoriesItemModel> categoriesItemList = [];
  categoriesItemList.add(FDCategoriesItemModel(image: FDVegetableCategoryImage, name: 'Vegetable'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDMeatCategoryImage, name: 'Meat'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDSeafoodCategoryImage, name: 'Seafood'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDDrinkCategoryImage, name: 'Drink'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDDriedfoodCategoryImage, name: 'Dried foods'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDFastfoodCategoryImage, name: 'Fast food'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDFruitCategoryImage, name: 'Fruit'));
  //categoriesItemList.add(FDCategoriesItemModel(image: FDMoreCategoryImage, name: 'More'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDVegetableCategoryImage, name: 'Vegetable'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDMeatCategoryImage, name: 'Meat'));
  categoriesItemList.add(FDCategoriesItemModel(image: FDSeafoodCategoryImage, name: 'Seafood'));
  return categoriesItemList;
}

List<FDVoucherItemModel> fdGetVoucherItems() {
  List<FDVoucherItemModel> voucherItemList = [];
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher1Image, voucherCode: '2DQWD3', date: '23 December', color: FDRedColor));
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher2Image, voucherCode: 'RF3E32', date: '4 Jan', color: FDSelectedTextColor));
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher3Image, voucherCode: '4H5RT5', date: '12 Nov', color: FDSecondaryColor));
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher1Image, voucherCode: '2DQWD3', date: '23 December', color: FDRedColor));
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher2Image, voucherCode: 'RF3E32', date: '4 Jan', color: FDSelectedTextColor));
  voucherItemList.add(FDVoucherItemModel(image: FDVoucher3Image, voucherCode: '4H5RT5', date: '12 Nov', color: FDSecondaryColor));
  return voucherItemList;
}

List<FDAddressModel> fdGetAddress() {
  List<FDAddressModel> addressList = [];
  addressList.add(
    FDAddressModel(name: 'Marshall Erikson', contactNo: '+349867345627', addressName: 'Home', address: '204, Shivam Appartment, MI 48423'),
  );
  addressList.add(
    FDAddressModel(name: 'Marshall Erikson', contactNo: '+349867345627', addressName: 'Company', address: '204, Shivam Appartment, MI 48423'),
  );
  return addressList;
}

/*List<FDFavouriteItemModel> fdGetFavouriteItems() {
  List<FDFavouriteItemModel> favouriteItemList = [];
  favouriteItemList.add(FDFavouriteItemModel(name: 'Snacks', image: FDSnackImage, dollarPrice: 3, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Hamburger', image: FDHamburgerImage, dollarPrice: 6, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Pizza', image: FDPizzaImage, dollarPrice: 9, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Beef Noodle', image: FDBeefNoodleImage, dollarPrice: 5, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Snacks', image: FDSnackImage, dollarPrice: 3, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Hamburger', image: FDHamburgerImage, dollarPrice: 6, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Pizza', image: FDPizzaImage, dollarPrice: 9, isFavourite: true));
  favouriteItemList.add(FDFavouriteItemModel(name: 'Beef Noodle', image: FDBeefNoodleImage, dollarPrice: 5, isFavourite: true));
  return favouriteItemList;
}*/

List<FDMyOrderHistoryItemModel> fdGetMyOrderHistoryItems() {
  List<FDMyOrderHistoryItemModel> myOrderHistoryItemList = [];
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDPanirImage, name: 'Paneer', dollarPrice: 6));
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDSnackImage, name: 'Snacks', dollarPrice: 7));
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDHamburgerImage, name: 'Hamburger', dollarPrice: 5));
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDRiceImage, name: 'Rice', dollarPrice: 6));
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDNoodlesImage, name: 'Noodles', dollarPrice: 7));
  myOrderHistoryItemList.add(FDMyOrderHistoryItemModel(image: FDPizzaImage, name: 'Pizza', dollarPrice: 5));
  return myOrderHistoryItemList;
}

List<FDMyOrderCommingItemModel> fdGetMyOrderCommingItems() {
  List<FDMyOrderCommingItemModel> myOrderCommingItemList = [];
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDRiceImage, name: 'Rice', dollarPrice: 6, flag: 0, time: '14:25'));
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDNoodlesImage, name: 'Noodles', dollarPrice: 7, flag: 1, time: '14:25'));
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDPizzaImage, name: 'Pizza', dollarPrice: 5, flag: 2, time: '14:25'));
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDPanirImage, name: 'Paneer', dollarPrice: 6, flag: 0, time: '14:25'));
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDSnackImage, name: 'Snacks', dollarPrice: 7, flag: 1, time: '14:25'));
  myOrderCommingItemList.add(FDMyOrderCommingItemModel(image: FDHamburgerImage, name: 'Hamburger', dollarPrice: 5, flag: 2, time: '14:25'));
  return myOrderCommingItemList;
}

/*List<FDMarketPopularItemModel> fdGetMarketPopularItems() {
  List<FDMarketPopularItemModel> marketPopularItemList = [];
  marketPopularItemList.add(FDMarketPopularItemModel(image: FDHamburgerImage, name: 'Hamburger', dollarPrice: 3, isFavourite: false, salePrice: 5));
  marketPopularItemList.add(FDMarketPopularItemModel(image: FDDriedfoodCategoryImage, name: 'Dried Foods', dollarPrice: 5, discount: 20, isFavourite: false));
  marketPopularItemList.add(FDMarketPopularItemModel(image: FDHamburgerImage, name: 'Hamburger', dollarPrice: 3, isFavourite: false, salePrice: 5));
  marketPopularItemList.add(FDMarketPopularItemModel(image: FDDriedfoodCategoryImage, name: 'Dried Foods', dollarPrice: 5, discount: 20, isFavourite: false));
  return marketPopularItemList;
}*/

List<FDFavouriteStoreItemModel> fdGetFavouriteStoreItems() {
  List<FDFavouriteStoreItemModel> favouriteStoreItemList = [];
  favouriteStoreItemList.add(FDFavouriteStoreItemModel(
    image: FDHomeImage3,
    name: 'Mr.Broo\'s Grocery',
    branches: 136,
    discount: 20,
    rating: 4.9,
  ));

  favouriteStoreItemList.add(FDFavouriteStoreItemModel(
    image: FDHomeImage1,
    name: 'Organic Store',
    branches: 136,
    discount: 20,
    rating: 4.9,
  ));

  favouriteStoreItemList.add(FDFavouriteStoreItemModel(
    image: FDHomeImage2,
    name: 'Korean Store',
    branches: 136,
    discount: 20,
    rating: 4.9,
  ));
  return favouriteStoreItemList;
}

List<FDFavouriteStoreProductsModel> fdGetFavouriteStoreProductsItems() {
  List<FDFavouriteStoreProductsModel> favouriteStoreProductItemList = [];
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDSpinachImage,
        name: 'Spinach',
        price: 3,
        perPriceName: 'kg',
        flag: 0,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '2 Kg',
        details:
            'Spinach (Spinacia oleracea) is a leafy green vegetable that originated in Persia.It belongs to the amaranth family and is related to beets and quinoa. What\'s more, it\'s considered very healthy, as it\'s loaded with nutrients and antioxidants.'),
  );
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDCarrotImage,
        name: 'Carrot',
        price: 3,
        perPriceName: 'pack',
        flag: 0,
        discount: 20,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The carrot (Daucus carota) is a root vegetable often claimed to be the perfect health food. It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits.'),
  );
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDCabbageImage,
        name: 'Cabbage',
        price: 3,
        perPriceName: 'pack',
        flag: 1,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The cabbage plant, Brassica oleracea, is an herbaceous annual or biennial vegetable in the family Brassicaceae grown for its edible head. ... The head of the cabbage is round and forms on a short thick stem. The leaves are thick and alternating with wavy or lobed edges and the roots are are fibrous and shallow.'),
  );
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDSpinachImage,
        name: 'Spinach',
        price: 3,
        perPriceName: 'kg',
        flag: 0,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '2 Kg',
        details:
            'Spinach (Spinacia oleracea) is a leafy green vegetable that originated in Persia.It belongs to the amaranth family and is related to beets and quinoa. What\'s more, it\'s considered very healthy, as it\'s loaded with nutrients and antioxidants.'),
  );
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDCarrotImage,
        name: 'Carrot',
        price: 3,
        perPriceName: 'pack',
        flag: 0,
        discount: 20,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The carrot (Daucus carota) is a root vegetable often claimed to be the perfect health food. It is crunchy, tasty, and highly nutritious. Carrots are a particularly good source of beta carotene, fiber, vitamin K1, potassium, and antioxidants ( 1 ). They also have a number of health benefits.'),
  );
  favouriteStoreProductItemList.add(
    FDFavouriteStoreProductsModel(
        image: FDCabbageImage,
        name: 'Cabbage',
        price: 3,
        perPriceName: 'pack',
        flag: 1,
        isCart: false,
        isFavourite: false,
        selectedQuantity: 1,
        quantityPerPrice: '1 pack',
        details:
            'The cabbage plant, Brassica oleracea, is an herbaceous annual or biennial vegetable in the family Brassicaceae grown for its edible head. ... The head of the cabbage is round and forms on a short thick stem. The leaves are thick and alternating with wavy or lobed edges and the roots are are fibrous and shallow.'),
  );
  return favouriteStoreProductItemList;
}

List<FDFavouriteStoreVoucherModel> fdGetFavouriteStoreVoucherItems() {
  List<FDFavouriteStoreVoucherModel> favouriteStoreVoucherItemList = [];
  favouriteStoreVoucherItemList.add(
    FDFavouriteStoreVoucherModel(
      image: FDVoucherIcon,
      date: '10 sep 2020',
      color: FDSelectedTextColor,
      description: 'Discount \$10 for all bill from \$50,only Online Shopping',
    ),
  );
  favouriteStoreVoucherItemList.add(
    FDFavouriteStoreVoucherModel(
      image: FDVoucherIcon,
      date: '10 sep 2020',
      color: FDRedColor,
      description: 'Discount \$10 for all bill from \$50,only Online Shopping',
    ),
  );
  favouriteStoreVoucherItemList.add(
    FDFavouriteStoreVoucherModel(
      image: FDVoucherIcon,
      date: '10 sep 2020',
      color: FDSecondaryColor,
      description: 'Discount \$10 for all bill from \$50,only Online Shopping',
    ),
  );
  return favouriteStoreVoucherItemList;
}

List<FDShippingDetailsModel> fdGetShippingDetails() {
  List<FDShippingDetailsModel> shippingDetailsList = [];
  shippingDetailsList.add(FDShippingDetailsModel(text: 'Send request', color: FDSelectedTextColor, time: '14.21'));
  shippingDetailsList.add(FDShippingDetailsModel(text: 'Request accepted', color: FDRedColor, time: '14.25'));
  shippingDetailsList.add(FDShippingDetailsModel(text: 'Picked up', color: Colors.purple, time: '14.30'));
  shippingDetailsList.add(FDShippingDetailsModel(text: 'Shipping', color: FDSecondaryColor, time: '14.35'));
  shippingDetailsList.add(FDShippingDetailsModel(text: 'Received order', color: grey));
  return shippingDetailsList;
}

List<FDPaymentCardModel> fdGetPaymentDetails() {
  List<FDPaymentCardModel> paymentDetailsList = [];
  paymentDetailsList.add(FDPaymentCardModel(cardNumber: '9845983498239834', holderName: 'Robin  Scherbatsky', expDate: '12/25'));
  paymentDetailsList.add(FDPaymentCardModel(cardNumber: '2309126745982367', holderName: 'Robin  Scherbatsky', expDate: '03/27'));
  return paymentDetailsList;
}

List<FDChatModel> fdGetChatDetais() {
  List<FDChatModel> chatDetails = [];
  chatDetails.add(FDChatModel(sender: deliever, text: 'Welcome', time: '10:20 AM'));
  chatDetails.add(FDChatModel(sender: customer, text: 'Thank You', time: '10:20 AM'));
  chatDetails.add(
    FDChatModel(
      sender: deliever,
      text: 'Your Order will be arrived at 10:30 am',
      time: '10:15 AM',
      image: FDHamburgerImage,
      name: 'Burger',
      price: 20,
    ),
  );
  return chatDetails;
}

final User deliever = User(id: 0, name: 'Deliever');
final User customer = User(id: 1, name: 'Ted Mosby');
