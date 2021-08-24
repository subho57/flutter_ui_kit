import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';

List<CardDetails> cardData = [CardDetails(cardNumber: '4578 4562 5643 9173', cardImage: 'images/handyman/hm_master.png')];

// you - current user
final User currentUser = User(id: 0, name: 'Current User', avatarUrl: 'images/handyman/users/hm_person1.jpg');
//user
final User selena = User(id: 1, name: 'Selena', avatarUrl: hm_person1, startingCost: 45);
final User james = User(id: 2, name: 'James', avatarUrl: hm_person2, startingCost: 55);
final User john = User(id: 3, name: 'John', avatarUrl: hm_person3, startingCost: 30);
final User melena = User(id: 4, name: "Melena", avatarUrl: hm_person4, startingCost: 100);
final User steave = User(id: 4, name: "Steave", avatarUrl: hm_person5, startingCost: 80);

List<User> fav = [selena, james, john, melena, steave];

List<HandymanData> handymanDataList = [
  HandymanData(
    user: selena,
    address: "Los Angeles",
    inHighDemand: true,
    isDiscount: true,
    offerRemote: false,
    numberReview: 75,
    starCount: 4,
    catName: "Lawn moving and trimming",
  ),
  HandymanData(
    user: james,
    address: "Dubai",
    inHighDemand: true,
    isDiscount: false,
    offerRemote: false,
    numberReview: 85,
    starCount: 5,
    catName: "Swimming pool cleaning",
  ),
  HandymanData(
    user: john,
    address: "America",
    inHighDemand: false,
    isDiscount: true,
    offerRemote: true,
    numberReview: 95,
    starCount: 3,
    catName: "Deck Repair",
  ),
  HandymanData(
    user: melena,
    address: "England",
    inHighDemand: false,
    isDiscount: true,
    offerRemote: true,
    numberReview: 55,
    starCount: 3,
    catName: "Home Cleaning",
  ),
  HandymanData(
    user: steave,
    address: "Singapore",
    inHighDemand: true,
    isDiscount: true,
    offerRemote: true,
    numberReview: 105,
    starCount: 5,
    catName: "Plumbing",
  )
];

List<HandymanData> ratingWiseList = [
  HandymanData(
    user: john,
    address: "America",
    inHighDemand: false,
    isDiscount: true,
    offerRemote: true,
    numberReview: 95,
    starCount: 5,
    catName: "Deck Repair",
  ),
  HandymanData(
    user: melena,
    address: "England",
    inHighDemand: false,
    isDiscount: true,
    offerRemote: true,
    numberReview: 55,
    starCount: 5,
    catName: "Home Cleaning",
  ),
  HandymanData(
    user: steave,
    address: "Singapore",
    inHighDemand: true,
    isDiscount: true,
    offerRemote: true,
    numberReview: 105,
    starCount: 5,
    catName: "Plumbing",
  )
];

List<HandymanData> inHighDemandList = [
  HandymanData(
    user: selena,
    address: "Los Angeles",
    inHighDemand: true,
    isDiscount: true,
    offerRemote: false,
    numberReview: 75,
    starCount: 4,
    catName: "Lawn moving and trimming",
  ),
  HandymanData(
    user: james,
    address: "Dubai",
    inHighDemand: true,
    isDiscount: false,
    offerRemote: false,
    numberReview: 85,
    starCount: 5,
    catName: "Swimming pool cleaning",
  ),
  HandymanData(
    user: john,
    address: "America",
    inHighDemand: true,
    isDiscount: true,
    offerRemote: true,
    numberReview: 95,
    starCount: 5,
    catName: "Deck Repair",
  )
];

List<MainCategory> mainCategoryList = [
  MainCategory(mainCat: "Outdoor upkeep", imageData: hm_lawn_moving_trimming),
  MainCategory(mainCat: "Painting", imageData: hm_painting),
  MainCategory(mainCat: "Interior painting", imageData: hm_interior_design),
  MainCategory(mainCat: "Plumbing", imageData: hm_emergency_plumbing),
  MainCategory(mainCat: "Deck repair", imageData: hm_deck_repair),
];

List<CategoryData> recommendedList = [
  CategoryData(image: hm_lawn_moving_trimming, catName: "Lawn Moving and trimming", startingPrice: 45, endingPrice: 125),
  CategoryData(image: hm_emergency_plumbing, catName: "Emergency plumbing", startingPrice: 45, endingPrice: 125),
  CategoryData(image: hm_deck_repair, catName: "Deck Repair", startingPrice: 10, endingPrice: 50),
  CategoryData(image: hm_painting, catName: "Painting", startingPrice: 50, endingPrice: 500),
  CategoryData(image: hm_window_repair, catName: "window repair", startingPrice: 25, endingPrice: 55),
  CategoryData(image: hm_ceiling_repair, catName: "roof and ceiling repair", startingPrice: 100, endingPrice: 150),
];

List<CategoryData> outdoorUpkeepList = [
  CategoryData(image: hm_lawn_moving_trimming, catName: "Lawn Moving and trimming", startingPrice: 45, endingPrice: 125),
  CategoryData(image: hm_swimming_pool_cleaning, catName: "Swimming pool cleaning", startingPrice: 55, endingPrice: 150),
  CategoryData(image: hm_door_repair, catName: "Door Repair", startingPrice: 15, endingPrice: 75),
  CategoryData(image: hm_deck_repair, catName: "Deck Repair", startingPrice: 10, endingPrice: 50)
];

List<CategoryData> essentialServiceList = [
  CategoryData(image: hm_emergency_plumbing, catName: "Emergency plumbing", startingPrice: 45, endingPrice: 125),
  CategoryData(image: hm_plumbing, catName: "Plumbing pipe repair", startingPrice: 10, endingPrice: 300),
  CategoryData(image: hm_painting, catName: "Painting", startingPrice: 50, endingPrice: 500),
  CategoryData(image: hm_home_cleaning, catName: "Home Cleaning", startingPrice: 20, endingPrice: 200)
];

List<CategoryData> moveHomeList = [
  CategoryData(image: hm_furniture_assembly, catName: "furniture assembly", startingPrice: 45, endingPrice: 85),
  CategoryData(image: hm_interior_design, catName: "interior design", startingPrice: 85, endingPrice: 130),
  CategoryData(image: hm_window_repair, catName: "window repair", startingPrice: 25, endingPrice: 55),
  CategoryData(image: hm_ceiling_repair, catName: "roof and ceiling repair", startingPrice: 100, endingPrice: 150),
  CategoryData(image: hm_touchup_painting, catName: "touch-up painting", startingPrice: 65, endingPrice: 95)
];

List<HandymanTaskData> taskData = [
  HandymanTaskData(handymanData: handymanDataList, isRated: false, dateTime: "04:45PM,Oct 15 2020", totalPrice: 325),
  HandymanTaskData(handymanData: handymanDataList, dateTime: "02:35PM,Aug 21 2020", totalPrice: 550),
  HandymanTaskData(handymanData: handymanDataList, dateTime: "08:55PM,Dec 12 2020", totalPrice: 225),
  HandymanTaskData(handymanData: handymanDataList, dateTime: "07:05PM,Jun 05 2020", totalPrice: 150),
];

List<BookAppointmentQuestion> bookAppQuestion = [
  BookAppointmentQuestion(question: "When would you like to us to come?", option: []),
  BookAppointmentQuestion(question: "And what's time?", option: []),
  BookAppointmentQuestion(
      question: "How often would you like lawn care service?",
      option: [
        ListOfOption(listOption: "One time only"),
        ListOfOption(listOption: "Once a week"),
        ListOfOption(listOption: "Every other week"),
        ListOfOption(listOption: "Once a month"),
      ],
      hasOption: true),
  BookAppointmentQuestion(
      question: "what is the type of property?",
      option: [ListOfOption(listOption: "Residential", icon: Icon(Icons.home_filled, color: hmColorPrimary)), ListOfOption(listOption: "Commercial", icon: Icon(Icons.location_city_rounded, color: hmColorPrimary))],
      hasOption: true),
  BookAppointmentQuestion(
      question: "how big is the lawn?",
      option: [
        ListOfOption(listOption: "Small (1,000 sq ft)"),
        ListOfOption(listOption: "Medium (1,000-5,000 sq ft)"),
        ListOfOption(listOption: "Large (5,000-10,000 sq ft)"),
        ListOfOption(listOption: "Very large (less 10,000 sq ft)"),
      ],
      hasOption: true),
  BookAppointmentQuestion(
      question: "What optional service do you want?",
      option: [
        ListOfOption(listOption: "Moving, trimming and edging"),
        ListOfOption(listOption: "Leaf clean-up"),
        ListOfOption(listOption: "Weeding and prevention"),
        ListOfOption(listOption: "Aeration"),
        ListOfOption(listOption: "Fertilizer and overseeding")
      ],
      isMultiChoice: true,
      hasOption: true),
  BookAppointmentQuestion(
      question: "Approximately how long the grass?",
      option: [
        ListOfOption(listOption: "Under 6 inch", icon: Icon(Icons.eco, color: Colors.green)),
        ListOfOption(listOption: "6 to 12 inch", icon: Icon(Icons.eco, color: Colors.green)),
      ],
      hasOption: true),
  BookAppointmentQuestion(
      question: "Do you need to be to site while the lawn professional is working?",
      option: [ListOfOption(listOption: "No, I don't need to be there"), ListOfOption(listOption: "Yes, i must be present")],
      hasOption: true),
  BookAppointmentQuestion(question: "Would you like to add photos or videos of your lawn?", option: []),
  BookAppointmentQuestion(question: "What other info should we pass along?", option: [])
];

List<ChatModel> chatModel = [
  ChatModel(sender: selena, text: "Hey do you free right now? i will call you"),
  ChatModel(sender: currentUser, text: "yah sure! I hope we will meet soon"),
  ChatModel(sender: selena, text: "I will be happy to repair your deck"),
  ChatModel(sender: currentUser, text: "That's nice but its completely depends on your work"),
  ChatModel(sender: selena, text: "yes i am glad to see you"),
  ChatModel(sender: selena, text: "come as soon as possible"),
  ChatModel(sender: currentUser, text: "Thank You :),meet soon")
];

List<FilterData> filterData = [
  FilterData(filterName: "Service Needed", isCheckBox: false),
  FilterData(filterName: "Moving, trimming and edging", checkBox: CommonCheckBox()),
  FilterData(filterName: "Leaf clea-up", checkBox: CommonCheckBox()),
  FilterData(filterName: "Weeding and prevention", checkBox: CommonCheckBox()),
  FilterData(filterName: "Fertilizer application", checkBox: CommonCheckBox()),
  FilterData(filterName: "Seeding or Overseeding", checkBox: CommonCheckBox()),
  FilterData(filterName: "Frequency of Services", isCheckBox: false),
  FilterData(filterName: "One time only", checkBox: CommonCheckBox()),
  FilterData(filterName: "Once a week", checkBox: CommonCheckBox()),
  FilterData(filterName: "Every other week", checkBox: CommonCheckBox()),
  FilterData(filterName: "Once a month", checkBox: CommonCheckBox()),
  FilterData(filterName: "Estimated Lawn Size", isCheckBox: false),
  FilterData(filterName: "Small(less than 1,000 sq ft)", checkBox: CommonCheckBox()),
  FilterData(filterName: "Medium(1,000 - 5,000 sq ft)", checkBox: CommonCheckBox()),
  FilterData(filterName: "Large(5,000 - 10,000 sq ft)", checkBox: CommonCheckBox()),
  FilterData(filterName: "Very Large(10,000 - 15,000 sq ft)", checkBox: CommonCheckBox()),
];
