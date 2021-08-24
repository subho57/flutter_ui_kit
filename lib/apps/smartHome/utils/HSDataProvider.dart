import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';

import 'HSConstant.dart';

List<HSDeviceModel> getDeviceList() {
  List<HSDeviceModel> list = [];
  list.add(HSDeviceModel(
    deviceId: DeviceTypeFan,
    deviceIcon: HS_lamp_icon,
    deviceName: "Lamp",
    status: "Off",
    isOn: false,
  ));
  list.add(HSDeviceModel(
    deviceId: DeviceTypeAc,
    deviceIcon: HS_lamp_icon,
    deviceName: "Air Conditioner",
    status: "Off",
    isOn: false,
  ));
  list.add(HSDeviceModel(
    deviceId: DeviceTypeFan,
    deviceIcon: HS_notification,
    deviceName: "Outlet",
    status: "Off",
    isOn: false,
  ));
  list.add(HSDeviceModel(
    deviceId: DeviceTypeFan,
    deviceIcon: HS_fan_icon,
    deviceName: "Fan",
    status: "Off",
    isOn: false,
  ));
  list.add(HSDeviceModel(
    deviceId: DeviceTypeAc,
    deviceIcon: HS_home_icon,
    deviceName: "Air Conditioner",
    status: "Off",
    isOn: false,
  ));
  list.add(HSDeviceModel(
    deviceId: DeviceTypeFan,
    deviceIcon: HS_world_icon,
    deviceName: "Lamp",
    status: "On",
    isOn: false,
  ));
  return list;
}

List<HsBrightnessModel> getBrightnessColorList() {
  List<HsBrightnessModel> list = [];
  list.add(HsBrightnessModel(color: Color(0XFFE53935)));
  list.add(HsBrightnessModel(color: Color(0XFF1E88E5)));
  list.add(HsBrightnessModel(color: Color(0XFF000000)));
  list.add(HsBrightnessModel(color: Color(0XFFFFB74D)));
  list.add(HsBrightnessModel(color: Color(0XFF81C784)));
  list.add(HsBrightnessModel(color: Color(0XFF757575)));
  list.add(HsBrightnessModel(color: Color(0XFF9E9D24)));
  list.add(HsBrightnessModel(color: Color(0XFF00897B)));
  return list;
}

List<HSRoomListModel> getRoomList() {
  List<HSRoomListModel> list = [];
  list.add(HSRoomListModel(roomName: "Living room", status: "Off", isOn: false));
  list.add(HSRoomListModel(roomName: "Bed room", status: "Off", isOn: false));
  list.add(HSRoomListModel(roomName: "Kitchen", status: "Off", isOn: false));
  list.add(HSRoomListModel(roomName: "Dining room", status: "Off", isOn: false));
  return list;
}

List<HSNewSceneModel> newSceneDeviceLst() {
  List<HSNewSceneModel> list = [];
  list.add(HSNewSceneModel(device: "Living Room", deviceName: "Lamp", isOn: false, isAdd: false));
  list.add(HSNewSceneModel(device: "Bed Room", deviceName: "Fan", isOn: false, isAdd: false));
  list.add(HSNewSceneModel(device: "Living Room", deviceName: "Air Conditioner", isOn: false, isAdd: false));
  list.add(HSNewSceneModel(device: "Bed Room", deviceName: "Lamp", isOn: false, isAdd: false));
  list.add(HSNewSceneModel(device: "Living Room", deviceName: "Fan", isOn: false, isAdd: false));
  list.add(HSNewSceneModel(device: "Bed Room", deviceName: "Lamp", isOn: false, isAdd: false));
  return list;
}
