import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/controller/splash_controller.dart';
import 'package:get/get.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(LoginController());

  }
}
