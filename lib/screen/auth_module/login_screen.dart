import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/screen/auth_module/sign_up_screen.dart';
import 'package:assetsmanagement/utils/widgets/app_loader.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<LoginController>(),
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('assets_management'.tr, style: AppTextStyle.splashTitleText.copyWith(fontSize: 36),textAlign: TextAlign.center),
                                  size.heightSpace(13),
                                  Text('login'.tr, style: AppTextStyle.regularHeadingText,textAlign: TextAlign.center),
                                  size.heightSpace(10),
                                  Text('please_sign_in_to_continue'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                                  size.heightSpace(60),
                                ],
                              ),
                              Text('email'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                              controller: controller.emailTextController,
                                height: controller.isValidate ? 50 : 75,
                                isShadow: controller.isShadow,
                                hintText: "enter_your_email".tr,
                                validator: (value) {
                                if (value!.trim().isEmpty) {
                                  controller.isValidate = false;
                                  controller.update();
                                  return 'please_enter_your_email'.tr;
                                } else if (!RegExp(emailValidationRegExp)
                                    .hasMatch(value)) {
                                  controller.isValidate = false;
                                  controller.update();
                                  return 'please_enter_valid_email'.tr;
                                }else{}
                                controller.isValidate = true;
                                controller.update();
                                return null;
                              },
                              ),
                              size.heightSpace(15),
                              Text('password'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                              controller: controller.passwordTextController,
                                height: controller.isValidate ? 50 : 117,
                                isShadow: controller.isShadow,
                                hintText: "enter_your_password".tr,
                                errorMaxLines: 3,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'please_enter_password'.tr;
                                  } else if (!RegExp(passwordValidationRegExp)
                                      .hasMatch(value)) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'strong_password'.tr;
                                  }else{}
                                  controller.isValidate = true;
                                  controller.update();
                                  return null;
                                },
                              ),
                              size.heightSpace(15),
                              AppButton(
                                  buttonText: "login".tr,
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {
                                      controller.login();
                                    }
                                  },
                                  isBorder: false
                              ),
                              size.heightSpace(15),
                              Align(alignment: Alignment.center, child: Text('forgot_password_?'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center)),
                              size.heightSpace(15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                      child: Divider(
                                        color: AppColor.secondPrimaryColor,
                                        thickness: 1,
                                        endIndent: 5.5,
                                        indent: 30,
                                      )
                                  ),
                                  Text('or_continue_with'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                                  const Expanded(
                                      child: Divider(
                                        color: AppColor.secondPrimaryColor,
                                        thickness: 1,
                                        endIndent: 30,
                                        indent: 5.5,
                                      )
                                  ),
                                ],
                              ),
                              size.heightSpace(15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.greyColor,
                                        ),
                                        borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Image.asset(AppImagePath.facebookIcon, width: size.width(24), height: size.height(24)),
                                    ),
                                  ),
                                  size.widthSpace(24),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.greyColor,
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Image.asset(AppImagePath.googleIcon, width: size.width(24), height: size.height(24)),
                                    ),
                                  ),
                                  size.widthSpace(24),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColor.greyColor,
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Image.asset(AppImagePath.appleIcon, width: size.width(24), height: size.height(24)),
                                    ),
                                  ),
                                ],
                              ),
                              size.heightSpace(130),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: RichText(
                                  text: TextSpan(
                                    text: "don't_have_an_account_? ".tr,
                                    style: AppTextStyle.regularSubTitleText,
                                    children:  <TextSpan>[
                                      TextSpan(text: 'sign_up'.tr, style: AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = () => Get.to(()=> SignUpScreen()))
                                    ],
                                  ),
                                ),
                              ),
                              size.heightSpace(20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            controller.isLoading ? appLoader() : const SizedBox()
          ],
        );
      },);
  }
}
