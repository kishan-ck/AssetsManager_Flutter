import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SplashController>(),
      builder: (controller) {
        return Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImagePath.splashBG,
                    height: double.infinity,
                    width: double.infinity,fit: BoxFit.fill),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient:  RadialGradient(
                        radius: 1.5,
                        colors: [
                          AppColor.whiteColor,
                          AppColor.whiteColor.withOpacity(0.3),
                        ],
                      ),
                  ),
                  child: Text('Assets Management',
                      style: AppTextStyle.splashTitleText,textAlign: TextAlign.center),
                ),

              ],
            )
        );
      },);
  }
}
