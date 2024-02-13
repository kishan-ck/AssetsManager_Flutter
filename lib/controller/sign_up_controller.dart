import 'dart:convert';

import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/screen/auth_module/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController nameSignUpTextController = TextEditingController();
  final TextEditingController phoneSignUpTextController = TextEditingController();
  final TextEditingController emailSignUpTextController = TextEditingController();
  final TextEditingController passwordSignUpTextController = TextEditingController();
  final TextEditingController confirmPasswordSignUpTextController = TextEditingController();

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isValidate = true;
  bool isShadow = true;


  Future<void> register() async {
    isLoading = true;
    update();

    await HttpHandler.postHttpMethod(
        url: APIEndPoints.registerUrl,data: {
      "fullname": nameSignUpTextController.text,
      "email": emailSignUpTextController.text,
      "phone_no": phoneSignUpTextController.text,
      "password": confirmPasswordSignUpTextController.text,
      "social_type": "3",
    }).then((value) async {
      if (value['error'] == null) {
        printData("Login Api ==> ${value['body']}");
        // LoginModel loginModel = LoginModel.fromJson(json.decode(value['body']));

        // await setDataToLocalStorage(
        //     dataType: StorageKey.stringType,
        //     stringData: loginModel.data?.authToken ?? "",
        //     prefKey: StorageKey.token);
        //
        // await setDataToLocalStorage(
        //     dataType: StorageKey.stringType,
        //     stringData: jsonEncode(jsonDecode(value["body"])),
        //     prefKey: StorageKey.authData);
        //
        // await setDataToLocalStorage(
        //     dataType: StorageKey.stringType,
        //     stringData: loginModel.data?.id ?? "",
        //     prefKey: StorageKey.userId);

        nameSignUpTextController.clear();
        phoneSignUpTextController.clear();
        emailSignUpTextController.clear();
        passwordSignUpTextController.clear();
        confirmPasswordSignUpTextController.clear();
        Get.offAll(() => const LoginScreen());

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