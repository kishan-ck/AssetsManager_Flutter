import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/controller/global_controller.dart';
import 'package:assetsmanagement/controller/home_controller.dart';
import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/controller/setting_controller.dart';
import 'package:assetsmanagement/controller/sign_up_controller.dart';
import 'package:assetsmanagement/controller/splash_controller.dart';
import 'package:assetsmanagement/controller/user_controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(SettingController());
    Get.put(BottomNavigationBarController());
    Get.put(HomeController());
    Get.put(UserController());
    Get.put(GlobalController());
    Get.put(AddAssetsController());
  }
}
