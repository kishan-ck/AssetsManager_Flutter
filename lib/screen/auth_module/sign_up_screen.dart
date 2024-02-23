import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/sign_up_controller.dart';
import 'package:assetsmanagement/utils/widgets/app_loader.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SignUpController>(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 25, ).copyWith(top: 46),
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
                                  Text('create_account'.tr, style: AppTextStyle.regularHeadingText,textAlign: TextAlign.center),
                                  size.heightSpace(10),
                                  Text('please_fill_the_input_below_here'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                                  size.heightSpace(60),
                                ],
                              ),
                              Text('email'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                                controller: controller.emailSignUpTextController,
                                height: controller.isValidate ? 50 : 75,
                                isShadow: controller.isShadow,
                                hintText: "enter_your_email".tr,
                                maxLines: 1,
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
                              Text('full_name'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                                controller: controller.nameSignUpTextController,
                                hintText: "enter_your_full_name".tr,
                                height: controller.isValidate ? 50 : 75,
                                isShadow: controller.isShadow,
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'please_enter_your_full_name'.tr;
                                  } else{}
                                  controller.isValidate = true;
                                  controller.update();
                                  return null;
                                },
                              ),
                              size.heightSpace(15),
                              Text('phone_no'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                                textInputType: TextInputType.number,
                                controller: controller.phoneSignUpTextController,
                                hintText: "enter_your_phone_no".tr,
                                height: controller.isValidate ? 50 : 75,
                                isShadow: controller.isShadow,
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'please_enter_your_phone_number'.tr;
                                  } else{}
                                  controller.isValidate = true;
                                  controller.update();
                                  return null;
                                },
                              ),
                              size.heightSpace(15),
                              Text('password'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                                height: controller.isValidate ? 50 : 117,
                                isShadow: controller.isShadow,
                                controller: controller.passwordSignUpTextController,
                                hintText: "enter_your_password".tr,
                                suffixIcn: GestureDetector(
                                    onTap: () {
                                      controller.passwordVisible = !controller.passwordVisible;
                                      controller.update();
                                    },
                                    child: controller.passwordVisible ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined)),
                                errorMaxLines: 3,
                                maxLines: 1,
                                obscuringCharacter: "*",
                                obscureText: controller.passwordVisible,
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
                              Text('confirm_password'.tr, style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              CustomTextField(
                                height: controller.isValidate ? 50 : 117,
                                isShadow: controller.isShadow,
                                controller: controller.confirmPasswordSignUpTextController,
                                hintText: "confirm_your_password".tr,
                                errorMaxLines: 3,
                                suffixIcn: GestureDetector(
                                    onTap: () {
                                      controller.confirmPasswordVisible = !controller.confirmPasswordVisible;
                                      controller.update();
                                    },
                                    child: controller.confirmPasswordVisible ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined)),
                                maxLines: 1,
                                obscuringCharacter: "*",
                                obscureText: controller.confirmPasswordVisible,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'please_confirm_your_password'.tr;
                                  } else if(controller.confirmPasswordSignUpTextController.text != controller.passwordSignUpTextController.text) {
                                    controller.isValidate = false;
                                    controller.update();
                                    return 'ⓘ_password_incorrect._please_re-check_your_password.'.tr;
                                  }
                                  controller.isValidate = true;
                                  controller.update();
                                  return null;
                                },
                              ),
                              size.heightSpace(15),
                              AppButton(
                                  buttonText: "sign_up".tr,
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {
                                      controller.register();
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
                              size.heightSpace(70),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: RichText(
                                  text: TextSpan(
                                    text: "already_have_an_account_? ".tr,
                                    style: AppTextStyle.regularSubTitleText,
                                    children:  <TextSpan>[
                                      TextSpan(text: 'sign_in'.tr, style: AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = () => Get.back())                            ],
                                  ),
                                ),
                              ),
                              size.heightSpace(30),
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
