import 'package:assetsmanagement/screen/auth_module/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=> const LoginScreen());
    });
  }
}