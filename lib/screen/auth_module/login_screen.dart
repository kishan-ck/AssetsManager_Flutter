import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoginController>(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(AppImagePath.splashBG,
                    height: double.infinity,
                    width: double.infinity,fit: BoxFit.fill),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 46),
                  decoration: BoxDecoration(
                    gradient:  RadialGradient(
                      radius: 1.5,
                      colors: [
                        AppColor.whiteColor,
                        AppColor.whiteColor.withOpacity(0.3),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Assets Management', style: AppTextStyle.splashTitleText.copyWith(fontSize: 36),textAlign: TextAlign.center),
                          size.heightSpace(13),
                          Text('Login', style: AppTextStyle.regularHeadingText,textAlign: TextAlign.center),
                          size.heightSpace(10),
                          Text('Please sign in to continue', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          size.heightSpace(60),
                        ],
                      ),

                      Text('Email', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                      CustomTextField(
                      controller: controller.emailTextController,
                        hintText: "Enter your email",

                      ),
                    ],
                  ),
                ),

              ],
            )
        );
      },);
  }
}
