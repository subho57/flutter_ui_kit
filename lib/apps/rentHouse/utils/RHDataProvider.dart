import 'dart:math';

import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHConstants.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';

List<AuthenticateRoomModel> getAuthenticateRoomList() {
  List<AuthenticateRoomModel> list = [];
  list.add(AuthenticateRoomModel(image: RH_home1));
  list.add(AuthenticateRoomModel(image: RH_home2));
  list.add(AuthenticateRoomModel(image: RH_home3));
  list.add(AuthenticateRoomModel(image: RH_home4));
  return list;
}

List<VerifiedRoomListModel> getVerifiedRoomList() {
  List<VerifiedRoomListModel> list = [];
  list.add(VerifiedRoomListModel(img: RH_home1, houseNo: "2", houseName: "Guest House Kitchen", housePrice: "\u002486.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home5, houseNo: "4", houseName: "Guest House Breakfast Area", housePrice: "\u002446.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home2, houseNo: "8", houseName: "House Leaving Area", housePrice: "\u002475.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home3, houseNo: "6", houseName: "House Reading Area", housePrice: "\u002420.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));

  return list;
}

List<VerifiedRoomListModel> getOtherRoomList() {
  List<VerifiedRoomListModel> list = [];
  list.add(VerifiedRoomListModel(img: RH_home6, houseNo: "2", houseName: "Guest House Bed Room", housePrice: "\u002486.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home5, houseNo: "4", houseName: "Guest House Breakfast Area", housePrice: "\u002446.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home7, houseNo: "8", houseName: "House Leaving Area", housePrice: "\u002475.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));
  list.add(VerifiedRoomListModel(img: RH_home3, houseNo: "6", houseName: "House Reading Area", housePrice: "\u002420.00/room", houseDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"));

  return list;
}

List<CityNameModel> getCityList() {
  List<CityNameModel> list = [];
  list.add(CityNameModel(cityName: "Florida"));
  list.add(CityNameModel(cityName: "Indiana"));
  list.add(CityNameModel(cityName: "Louisiana"));
  list.add(CityNameModel(cityName: "Montana"));
  list.add(CityNameModel(cityName: "Nevada"));
  list.add(CityNameModel(cityName: "New Jersey"));
  return list;
}

List<RoommateModel> getRoommatesList() {
  List<RoommateModel> list = [];
  list.add(
    RoommateModel(
      img: RH_user,
      name: "Lia Smith",
      minAmount: "\u002485",
      maxAmount: "\u0024120",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user1,
      name: "Jerry",
      minAmount: "\u0024100",
      maxAmount: "\u0024180",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user2,
      name: "Nora Joe",
      minAmount: "\u002460",
      maxAmount: "\u0024120",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user3,
      name: "Antonio",
      minAmount: "\u002480",
      maxAmount: "\u0024190",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user4,
      name: "Emma",
      minAmount: "\u002460",
      maxAmount: "\u0024100",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user5,
      name: "Lia",
      minAmount: "\u0024120",
      maxAmount: "\u0024180",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user6,
      name: "Isabella",
      minAmount: "\u0024110",
      maxAmount: "\u0024190",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  list.add(
    RoommateModel(
      img: RH_user7,
      name: "William",
      minAmount: "\u002480",
      maxAmount: "\u0024140",
      gender: "Male/Female",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
    ),
  );
  return list;
}

List<RHChatModel> getChatData() {
  List<RHChatModel> list = [];

  RHChatModel c1 = RHChatModel();
  c1.name = 'William';
  c1.img = RH_user;
  c1.time = 'online';
  c1.lastMsg = LoremText;
  c1.unreadCount = Random().nextInt(20);
  c1.isActive = true;
  c1.phoneNumber = '+91 544545645';
  list.add(c1);

  RHChatModel c2 = RHChatModel();
  c2.name = 'Smith';
  c2.img = RH_user1;
  c2.time = '5 min ago';
  c2.lastMsg = LoremText;
  c2.unreadCount = Random().nextInt(20);
  c2.isActive = true;
  c2.phoneNumber = '+91 9876743210';
  list.add(c2);

  RHChatModel c3 = RHChatModel();
  c3.name = 'Nora';
  c3.img = RH_user2;
  c3.time = '15 min ago';
  c3.lastMsg = LoremText;
  c3.unreadCount = Random().nextInt(20);
  c3.isActive = true;
  c3.phoneNumber = '+91 9886743410';
  list.add(c3);

  RHChatModel c4 = RHChatModel();
  c4.name = 'Emma';
  c4.img = RH_user3;
  c4.time = '20 min ago';
  c4.lastMsg = LoremText;
  c4.unreadCount = Random().nextInt(20);
  c4.isActive = true;
  c4.phoneNumber = '+91 9786743415';
  list.add(c4);

  RHChatModel c5 = RHChatModel();
  c5.name = 'Smith';
  c5.img = RH_user4;
  c5.time = '30 min ago';
  c5.lastMsg = LoremText;
  c5.unreadCount = Random().nextInt(20);
  c5.isActive = true;
  c5.phoneNumber = '+91 8786743417';
  list.add(c5);

  RHChatModel c6 = RHChatModel();
  c6.name = 'John';
  c6.img = RH_user5;
  c6.time = '30 min ago';
  c6.lastMsg = LoremText;
  c6.unreadCount = Random().nextInt(20);
  c6.isActive = true;
  c6.phoneNumber = '+91 8386743417';
  list.add(c6);

  RHChatModel c7 = RHChatModel();
  c7.name = 'Lia';
  c7.img = RH_user6;
  c7.time = '30 min ago';
  c7.lastMsg = LoremText;
  c7.unreadCount = Random().nextInt(20);
  c7.isActive = true;
  c7.phoneNumber = '+91 8686773417';
  list.add(c7);

  RHChatModel c8 = RHChatModel();
  c8.name = 'Nora';
  c8.img = RH_user7;
  c8.time = '30 min ago';
  c8.lastMsg = LoremText;
  c8.unreadCount = Random().nextInt(20);
  c8.isActive = true;
  c8.phoneNumber = '+91 876743417';
  list.add(c8);

  RHChatModel c9 = RHChatModel();
  c9.name = 'Lia';
  c9.img = RH_user8;
  c9.time = '30 min ago';
  c9.lastMsg = LoremText;
  c9.unreadCount = Random().nextInt(20);
  c9.isActive = true;
  c9.phoneNumber = '+91 8786743418';
  list.add(c9);

  RHChatModel c10 = RHChatModel();
  c10.name = 'Wills';
  c10.img = RH_user9;
  c10.time = '30 min ago';
  c10.lastMsg = LoremText;
  c10.unreadCount = Random().nextInt(20);
  c10.isActive = true;
  c10.phoneNumber = '+91 8786745417';
  list.add(c10);

  RHChatModel c11 = RHChatModel();
  c11.name = 'James';
  c11.img = RH_user10;
  c11.time = '30 min ago';
  c11.lastMsg = LoremText;
  c11.unreadCount = Random().nextInt(20);
  c11.isActive = true;
  c11.phoneNumber = '+91 8786773417';
  list.add(c11);

  return list;
}

List<RHMessageModel> getChatMsgData() {
  List<RHMessageModel> list = [];

  RHMessageModel c1 = RHMessageModel();
  c1.senderId = sender_id;
  c1.receiverId = receiver_id;
  c1.msg = 'Hi';
  c1.time = '11:30 AM';
  list.add(c1);

  RHMessageModel c2 = RHMessageModel();
  c2.senderId = sender_id;
  c2.receiverId = receiver_id;
  c2.msg = 'Hello';
  c2.time = '11:30 AM';
  list.add(c2);

  RHMessageModel c3 = RHMessageModel();
  c3.senderId = receiver_id;
  c3.receiverId = sender_id;
  c3.msg = 'How are you?';
  c3.time = '11:30 AM';
  list.add(c3);

  RHMessageModel c4 = RHMessageModel();
  c4.senderId = sender_id;
  c4.receiverId = receiver_id;
  c4.msg = 'I am good. Good to hear';
  c4.time = '11:31 AM';
  list.add(c4);

  RHMessageModel c5 = RHMessageModel();
  c5.senderId = sender_id;
  c5.receiverId = receiver_id;
  c5.msg = 'I am good. I need your help.';
  c5.time = '11:31 AM';
  list.add(c5);

  RHMessageModel c6 = RHMessageModel();
  c6.senderId = receiver_id;
  c6.receiverId = sender_id;
  c6.msg = 'I am good.I need your help.';
  c6.time = '11:31 AM';
  list.add(c6);

  RHMessageModel c7 = RHMessageModel();
  c7.senderId = sender_id;
  c7.receiverId = receiver_id;
  c7.msg = 'I am good. I need your help.';
  c7.time = '11:31 AM';
  list.add(c7);

  RHMessageModel c8 = RHMessageModel();
  c8.senderId = receiver_id;
  c8.receiverId = sender_id;
  c8.msg = 'I am good. I need your help.';
  c8.time = '11:31 AM';
  list.add(c8);

  RHMessageModel c9 = RHMessageModel();
  c9.senderId = sender_id;
  c9.receiverId = receiver_id;
  c9.msg = 'I am good. I need your help.';
  c9.time = '11:31 AM';
  list.add(c9);

  RHMessageModel c10 = RHMessageModel();
  c10.senderId = receiver_id;
  c10.receiverId = sender_id;
  c10.msg = 'I am good. I need your help.';
  c10.time = '11:32 AM';
  list.add(c10);

  RHMessageModel c11 = RHMessageModel();
  c11.senderId = receiver_id;
  c11.receiverId = sender_id;
  c11.msg = 'I am good.I need your help.';
  c11.time = '11:31 AM';
  list.add(c11);

  RHMessageModel c12 = RHMessageModel();
  c12.senderId = sender_id;
  c12.receiverId = receiver_id;
  c12.msg = 'I am good. I need your help.';
  c12.time = '11:32 AM';
  list.add(c12);

  RHMessageModel c13 = RHMessageModel();
  c13.senderId = sender_id;
  c13.receiverId = receiver_id;
  c13.msg = 'I am good. Can you do something for me?.';
  c13.time = '11:32 AM';
  list.add(c13);

  RHMessageModel c14 = RHMessageModel();
  c14.senderId = receiver_id;
  c14.receiverId = sender_id;
  c14.msg = 'I am good.I need your help.';
  c14.time = '11:32 AM';
  list.add(c14);

  RHMessageModel c15 = RHMessageModel();
  c15.senderId = sender_id;
  c15.receiverId = receiver_id;
  c15.msg = 'I am good.I need your help.';
  c15.time = '11:32 AM';
  list.add(c15);

  RHMessageModel c16 = RHMessageModel();
  c16.senderId = receiver_id;
  c16.receiverId = sender_id;
  c16.msg = 'I am good.';
  c16.time = '11:32 AM';
  list.add(c16);

  RHMessageModel c17 = RHMessageModel();
  c17.senderId = sender_id;
  c17.receiverId = receiver_id;
  c17.msg = 'I am good.';
  c17.time = '11:32 AM';
  list.add(c17);

  RHMessageModel c18 = RHMessageModel();
  c18.senderId = receiver_id;
  c18.receiverId = sender_id;
  c18.msg = 'Can you do something for me?';
  c18.time = '11:32 AM';
  list.add(c18);

  return list;
}
