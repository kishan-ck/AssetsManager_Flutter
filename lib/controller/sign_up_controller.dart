import 'dart:convert';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/screen/auth_module/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final TextEditingController nameSignUpTextController =
      TextEditingController();
  final TextEditingController phoneSignUpTextController =
      TextEditingController();
  final TextEditingController emailSignUpTextController =
      TextEditingController();
  final TextEditingController passwordSignUpTextController =
      TextEditingController();
  final TextEditingController confirmPasswordSignUpTextController =
      TextEditingController();

  bool isLoading = false;
  bool isValidate = true;
  bool isShadow = true;

  Future<void> register() async {
    isLoading = true;
    update();

    await HttpHandler.postHttpMethod(url: APIEndPoints.registerUrl, data: {
      "fullname": nameSignUpTextController.text,
      "email": emailSignUpTextController.text,
      "phone_no": phoneSignUpTextController.text,
      "password": confirmPasswordSignUpTextController.text,
      "social_type": "3",
    }).then((value) async {
      if (value['error'] == null) {
        printData("register Api ==> ${value['body']}");
        nameSignUpTextController.clear();
        phoneSignUpTextController.clear();
        emailSignUpTextController.clear();
        passwordSignUpTextController.clear();
        confirmPasswordSignUpTextController.clear();
        commonSnackBar(
            message: "${jsonDecode(value['body'])['message']}", isError: false);
        Get.offAll(() => LoginScreen());
      } else {
        printData("register Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }
}
