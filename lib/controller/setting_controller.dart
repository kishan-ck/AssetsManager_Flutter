import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidate = false;

  List menuList = [
    {
      "icon": AppImagePath.notificationIcon,
      "text": "Notifications",
    },
    {
      "icon": AppImagePath.languageIcon,
      "text": "Language",
    },
    {
      "icon": AppImagePath.shieldIcon,
      "text": "Privacy",
    },
    {
      "icon": AppImagePath.infoIcon,
      "text": "About Us",
    }
  ];

  showUpdateProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(child: Text("update_profile".tr)),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.find<AddAssetsController>().openFileExplorer();
                        },
                        child: Container(
                          height: size.height(150),
                          width: size.width(150),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteColor),
                          child: Center(
                            child: Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ),
                    Text("full_name".tr),
                    CustomTextField(
                      textInputType: TextInputType.number,
                      controller: nameController,
                      hintText: "full_name".tr,
                      height: isValidate ? 50 : 75,
                      // isShadow: controller.isShadow,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_your_full_name'.tr;
                        } else {}
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    Text('email'.tr,
                        style: AppTextStyle.regularSubTitleText,
                        textAlign: TextAlign.center),
                    CustomTextField(
                      height: isValidate ? 50 : 75,
                      // isShadow: controller.isShadow,
                      controller: emailController,
                      hintText: "enter_your_email".tr,
                      errorMaxLines: 3,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_email'.tr;
                        } else if (!RegExp(emailValidationRegExp)
                            .hasMatch(value)) {
                          isValidate = false;
                          update();
                          return 'please_enter_valid_email'.tr;
                        } else {}
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    Text('phone_no'.tr,
                        style: AppTextStyle.regularSubTitleText,
                        textAlign: TextAlign.center),
                    CustomTextField(
                      height: isValidate ? 50 : 75,
                      // isShadow: isShadow,
                      controller: phoneController,
                      hintText: "phone_no".tr,
                      errorMaxLines: 3,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          isValidate = false;
                          update();
                          return 'please_enter_phone_no'.tr;
                        }
                        isValidate = true;
                        update();
                        return null;
                      },
                    ),
                    size.heightSpace(15),
                    AppButton(
                        buttonText: "update_profile".tr,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        isBorder: false),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
