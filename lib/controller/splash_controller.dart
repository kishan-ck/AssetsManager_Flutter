import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/controller/global_controller.dart';
import 'package:assetsmanagement/screen/auth_module/login_screen.dart';
import 'package:assetsmanagement/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  onInit() async {
    super.onInit();
    bool isLogin = await getDataFromLocalStorage(
    dataType: StorageKey.boolType,
    prefKey: StorageKey.isLogin) ??
        false;
    Future.delayed(const Duration(seconds: 3), () {
      if(isLogin == true){
        Get.find<BottomNavigationBarController>().selectedIndex = 0;
        Get.find<BottomNavigationBarController>().update();
        Get.find<GlobalController>().homeData();
        Get.offAll(() => const BottomNavigationBarScreen());
      } else{
        Get.offAll(() => LoginScreen());
      }
    });
  }
}