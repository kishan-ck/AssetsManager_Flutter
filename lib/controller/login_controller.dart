import 'dart:convert';

import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/controller/bottom_nav_bar_controller.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/models/auth/login_model.dart';
import 'package:assetsmanagement/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isValidate = true;
  bool isShadow = true;

  Future<void> login() async {
    isLoading = true;
    update();

    await HttpHandler.postHttpMethod(
        url: APIEndPoints.loginUrl,data: {
      "email": emailTextController.text,
      "password": passwordTextController.text,
      "social_type": "3",
    }).then((value) async {
      if (value['error'] == null) {
        printData("Login Api ==> ${value['body']}");
        LoginModel loginModel = LoginModel.fromJson(json.decode(value['body']));

        await setDataToLocalStorage(
        dataType: StorageKey.stringType,
        stringData: loginModel.data?.authToken ?? "",
        prefKey: StorageKey.token);

        await setDataToLocalStorage(
        dataType: StorageKey.stringType,
        stringData: jsonEncode(jsonDecode(value["body"])),
        prefKey: StorageKey.authData);

        await setDataToLocalStorage(
            dataType: StorageKey.stringType,
            stringData: loginModel.data?.id ?? "",
            prefKey: StorageKey.userId);

        emailTextController.clear();
        passwordTextController.clear();
        Get.find<BottomNavigationBarController>().selectedIndex = 0;
        Get.find<BottomNavigationBarController>().update();
        Get.offAll(() => const BottomNavigationBarScreen());

      } else {
        printData("Login Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        foodLocatorSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

}