import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
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
              children: [
                Image.asset(AppImagePath.splashBG,
                    height: double.infinity,
                    width: double.infinity,fit: BoxFit.fill),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(AppImagePath.coinIcon,height: size.height(34),width: size.width(33),),
                      size.widthSpace(8),
                      Text('Assets Management',
                        style: TextStyle(
                            fontFamily: 'Jura',
                            fontSize: size.height(45),fontWeight: FontWeight.w700,color: AppColor.whiteColor,letterSpacing: 1.5),),
                    ],
                  ),
                ),
              ],
            )
        );
      },);
  }
}
