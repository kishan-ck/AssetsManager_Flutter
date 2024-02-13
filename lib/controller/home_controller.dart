import 'dart:convert';

import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/models/auth/login_model.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late LoginModel loginModel;

  getData()async{

    loginModel = LoginModel.fromJson(json.decode(await getDataFromLocalStorage(
        dataType: StorageKey.stringType,
        prefKey: StorageKey.token) ??
        ""));
  }
}