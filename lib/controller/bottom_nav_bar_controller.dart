import 'package:assetsmanagement/screen/main_screens/add_asset_flow/add_asset_screen.dart';
import 'package:assetsmanagement/screen/main_screens/global_flow/global_screen.dart';
import 'package:assetsmanagement/screen/main_screens/setting_flow/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavigationBarController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screens = [
    const GlobalScreen(),
    const AddAssetScreen(),
    const SettingScreen(),
  ];

  Future<bool> onWillPop() async {
    if (selectedIndex != 0) {
      selectedIndex = 0;
      update();
      return false;
    }
    return true;
  }
}
