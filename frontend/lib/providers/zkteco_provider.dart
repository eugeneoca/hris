import 'package:flutter/material.dart';

class ZKUserProvider extends ChangeNotifier {
  bool isConnected;
  String deviceName;
  String firmwareVersion;
  String serialNumber;
  int userCount;

  ZKUserProvider(
      {this.isConnected = false,
      this.deviceName = "",
      this.firmwareVersion = "",
      this.serialNumber = "",
      this.userCount = 0});

  void setDeviceName(String deviceName) {
    this.deviceName = deviceName;
    notifyListeners();
  }

  void setSerialNumber(String serialNumber) {
    this.serialNumber = serialNumber;
    notifyListeners();
  }

  void setFirmwareVersion(String firmwareVersion) {
    this.firmwareVersion = firmwareVersion;
    notifyListeners();
  }

  void setUserCount(int userCount) {
    this.userCount = userCount;
    notifyListeners();
  }

  void connected() {
    isConnected = true;
    notifyListeners();
  }

  void disconnected() {
    isConnected = false;
    notifyListeners();
  }
}
