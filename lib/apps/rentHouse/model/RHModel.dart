class AuthenticateRoomModel {
  String image;

  AuthenticateRoomModel({this.image});
}

class VerifiedRoomListModel {
  String img;
  String houseNo;
  String houseName;
  String housePrice;
  String houseDescription;

  VerifiedRoomListModel({this.img, this.houseNo, this.houseName, this.housePrice, this.houseDescription});
}

class CityNameModel {
  String cityName;

  CityNameModel({this.cityName});
}

class RoommateModel {
  String img;
  String name;
  String minAmount;
  String maxAmount;
  String gender;
  String description;

  RoommateModel({this.img, this.name, this.minAmount, this.maxAmount, this.gender, this.description});
}

class RHChatModel {
  var name;
  var img;
  var lastMsg;
  var time;
  int unreadCount;
  var phoneNumber;
  bool isActive;

  RHChatModel({this.name, this.img, this.lastMsg, this.time, this.unreadCount, this.phoneNumber, this.isActive});
}

class RHMessageModel {
  int senderId;
  int receiverId;
  String msg;
  String time;

  RHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
