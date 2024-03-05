import 'dart:convert';
import 'dart:io';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_button.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/models/auth/get_user_model.dart';
import 'package:assetsmanagement/models/auth/update_user_model.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/asset/asset_model.dart';

class SettingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isLoading = false;

  AssetModel? assetModel;
  GetUserModel? getUserModelData;
  File? path;

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

  Future<void> getAssetData() async {
    isLoading = true;
    Get.find<AddAssetsController>().update();
    update();
    String userId = await getDataFromLocalStorage(
        dataType: StorageKey.stringType, prefKey: StorageKey.userId);
    await HttpHandler.getHttpMethod(url: "${APIEndPoints.assetUrl}?userId=$userId")
        .then((value) async {
      if (value['error'] == null) {
        printData("getAssetData Api ==> ${value['body']}");
        assetModel = AssetModel.fromJson(json.decode(value['body']));
        await getUserAPI();
        isLoading = false;
        update();
      } else {
        printData("getAssetData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });
    isLoading = false;
    Get.find<AddAssetsController>().update();
    update();
  }

  void openFileExplorer(
      {bool isMultiSelection = false,
      FileType filePickingType = FileType.image}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: filePickingType,
      allowMultiple: false,
    );

    if (result != null) {
      print("result-----> $result");
      path = File(result.paths.first ?? "");
      Get.find<AddAssetsController>().uploadImages();
      print("PATH-----> $path");
      update();
    } else {
      printData("Image Not Select =====>");
    }
  }

  Future<void> updateUserProfileAPI() async {
    isLoading = true;
    update();
    String userId = await getDataFromLocalStorage(
        dataType: StorageKey.stringType, prefKey: StorageKey.userId);
    printData("userId === $userId");
    await HttpHandler.putHttpMethod(
        url: APIEndPoints.updateUser(userId: userId),
        data: {
          "fullname": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phone_no": phoneController.text.trim(),
        }).then((value) async {
      if (value['error'] == null) {
        printData("Update User Api ==> ${value['body']}");
        UpdateUserProfileModel updateUserProfileModel =
            UpdateUserProfileModel.fromJson(json.decode(value['body']));
        await getUserAPI();
        isLoading = false;
        update();
        Get.back();
        commonSnackBar(message: "Profile Update Successfully", isError: false);
      } else {
        printData("Update User Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });
    isLoading = false;
    update();
  }

  Future<void> getUserAPI() async {
    String userId = await getDataFromLocalStorage(
        dataType: StorageKey.stringType, prefKey: StorageKey.userId);
    printData("userId Get User===>> $userId");
    await HttpHandler.getHttpMethod(
            url: APIEndPoints.getUserUrl(userId: userId))
        .then((value) async {
      if (value['error'] == null) {
        printData("Get User Api ==> ${value['body']}");
        getUserModelData = GetUserModel.fromJson(json.decode(value['body']));
        nameController.text = getUserModelData?.data?.fullname ?? "";
        emailController.text = getUserModelData?.data?.email ?? "";
        phoneController.text = "${getUserModelData?.data?.phoneNo ?? ""}";
        update();
      } else {
        printData("Get User Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });
  }

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
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteColor),
                          child: getUserModelData?.data?.image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(105),
                                  child: Image.memory(
                                    const Base64Decoder().convert(
                                        getUserModelData?.data?.image
                                                ?.split(',')
                                                .elementAt(1) ??
                                            ""),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Center(
                                  child: Icon(Icons.camera_alt),
                                ),
                        ),
                      ),
                    ),
                    Text("full_name".tr),
                    CustomTextField(
                      textInputType: TextInputType.text,
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
                      textInputType: TextInputType.phone,
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
                          if (formKey.currentState!.validate()) {
                            Get.back();
                            updateUserProfileAPI();
                          }
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
