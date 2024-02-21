import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/controller/sign_up_controller.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SignUpController>(),
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
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Assets Management', style: AppTextStyle.splashTitleText.copyWith(fontSize: 36),textAlign: TextAlign.center),
                              size.heightSpace(13),
                              Text('Create Account', style: AppTextStyle.regularHeadingText,textAlign: TextAlign.center),
                              size.heightSpace(10),
                              Text('Please fill the input below here', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                              size.heightSpace(60),
                            ],
                          ),
                          Text('Email', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          CustomTextField(
                            controller: controller.emailSignUpTextController,
                            height: controller.isValidate ? 50 : 75,
                            isShadow: controller.isShadow,
                            hintText: "Enter your email",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please enter your email';
                              } else if (!RegExp(emailValidationRegExp)
                                  .hasMatch(value)) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please enter valid email';
                              }else{}
                              controller.isValidate = true;
                              controller.update();
                              return null;
                            },
                          ),
                          size.heightSpace(15),
                          Text('Full Name', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          CustomTextField(
                            controller: controller.nameSignUpTextController,
                            hintText: "Enter your full name",
                            height: controller.isValidate ? 50 : 75,
                            isShadow: controller.isShadow,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please enter your full name';
                              } else{}
                              controller.isValidate = true;
                              controller.update();
                              return null;
                            },
                          ),
                          size.heightSpace(15),
                          Text('Phone No', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.phoneSignUpTextController,
                            hintText: "Enter your phone no",
                            height: controller.isValidate ? 50 : 75,
                            isShadow: controller.isShadow,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please enter your phone umber';
                              } else{}
                              controller.isValidate = true;
                              controller.update();
                              return null;
                            },
                          ),
                          size.heightSpace(15),
                          Text('Password', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          CustomTextField(
                            height: controller.isValidate ? 50 : 75,
                            isShadow: controller.isShadow,
                            controller: controller.passwordSignUpTextController,
                            hintText: "Enter your password",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please enter password';
                              } else if (!RegExp(passwordValidationRegExp)
                                  .hasMatch(value)) {
                                controller.isValidate = false;
                                controller.update();
                                return 'ⓘ Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
                              }else{}
                              controller.isValidate = true;
                              controller.update();
                              return null;
                            },
                          ),
                          size.heightSpace(15),
                          Text('Confirm Password', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
                          CustomTextField(
                            height: controller.isValidate ? 50 : 75,
                            isShadow: controller.isShadow,
                            controller: controller.confirmPasswordSignUpTextController,
                            hintText: "Confirm your password",
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                controller.isValidate = false;
                                controller.update();
                                return 'Please confirm your password';
                              } else if (!RegExp(passwordValidationRegExp)
                                  .hasMatch(value)) {
                                controller.isValidate = false;
                                controller.update();
                                return 'ⓘ Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
                              }else if(controller.confirmPasswordSignUpTextController.text != controller.passwordSignUpTextController.text){
                                controller.isValidate = false;
                                controller.update();
                                return 'ⓘ Password incorrect. Please re-check your password.';
                              }
                              controller.isValidate = true;
                              controller.update();
                              return null;
                            },
                          ),
                          size.heightSpace(15),
                          AppButton(
                              buttonText: "Sign Up",
                              onPressed: (){
                                if (controller.formKey.currentState!.validate()) {
                                  controller.register();
                                }
                              },
                              isBorder: false
                          ),
                          size.heightSpace(15),
                          Align(alignment: Alignment.center, child: Text('Forgot password ?', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center)),
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
                              Text('or continue with', style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center),
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
                                text: "Already have an account ? ",
                                style: AppTextStyle.regularSubTitleText,
                                children:  <TextSpan>[
                                  TextSpan(text: 'Sign in', style: AppTextStyle.regularSubTitleText.copyWith(color: AppColor.secondPrimaryColor,fontWeight: FontWeight.bold),recognizer: TapGestureRecognizer()..onTap = () => Get.back())                            ],
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
        );
      },);
  }
}
