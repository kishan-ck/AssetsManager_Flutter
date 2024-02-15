import 'dart:convert';

import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/models/asset/asset_model.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAssetsController extends GetxController{

  String selectedSubCategoryController = "Residential Land";
  String isSolelyOwned = "No";
  String title = "Partner - 1";

  TextEditingController assetNameTextController = TextEditingController();
  TextEditingController assetIdTextController = TextEditingController();
  TextEditingController assetQuantityTextController = TextEditingController();
  TextEditingController assetOwnedTextController = TextEditingController();
  TextEditingController assetDescriptionTextController = TextEditingController();
  TextEditingController partnerNameTextController = TextEditingController();
  TextEditingController partnerOwnedTextController = TextEditingController();
  TextEditingController partnerPhoneTextController = TextEditingController();

  c.ExpansionTileController partnerExpansionTileController = c.ExpansionTileController();


  bool startAnimation = false;
  bool isExpanseChange = false;
  bool isLoading = false;

  List<String> subCategoryDropDownItems = [
    "Residential Land",
    "Commercial Land",
    "Agricultural Land",
    "Industrial Land",
    "Vacant Land",
    "Urban Land",
   "Rural Land",
  ];

  List<String> solelyOwnedList = [
    "Yes",
    "No"
  ];

  List categoryData = [
    {
     "type": "Land",
      "icon": AppImagePath.landIcon,
     "bg": AppImagePath.landBg
    },
    {
     "type": "Collectables",
      "icon": AppImagePath.collectablesIcon,
     "bg": AppImagePath.collectablesBg
    },
    {
     "type": "Crypto",
      "icon": AppImagePath.cryptoIcon,
     "bg": AppImagePath.cryptoBg
    },
    {
     "type": "Real Estate",
      "icon": AppImagePath.realEstateIcon,
     "bg": AppImagePath.realEstateBg
    },
    {
     "type": "Metals",
      "icon": AppImagePath.metalIcon,
     "bg": AppImagePath.metalBg
    },
  ];

  Future<void> addAsset() async {
    isLoading = true;
    update();

    await HttpHandler.postHttpMethod(
        url: APIEndPoints.assetUrl,data: {
      "name": assetNameTextController.text,
      "description": assetNameTextController.text,
      "assetId": assetNameTextController.text,
      "numberOfMeasurement": assetNameTextController.text,
      "measurementType": assetNameTextController.text,
      "isAssetSolelyOwned": isSolelyOwned == "Yes" ? true : false,
      "percentOwned": assetOwnedTextController.text,
      "userId": "65cb5b780f6a3412a891d56e",
      "subCategoryId": selectedSubCategoryController,
      "partner": [],
      "images": []
    }).then((value) async {
      if (value['error'] == null) {
        printData("addAsset Api ==> ${value['body']}");

        assetNameTextController.clear();
        assetIdTextController.clear();
        assetQuantityTextController.clear();
        assetOwnedTextController.clear();
        assetDescriptionTextController.clear();
        Get.back();

      } else {
        printData("addAsset Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

  Future<void> getAssetData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
        url: APIEndPoints.assetUrl).then((value) async {
      if (value['error'] == null) {
        printData("getAssetData Api ==> ${value['body']}");
        AssetModel assetModel = AssetModel.fromJson(json.decode(value['body']));

        await setDataToLocalStorage(
            dataType: StorageKey.stringType,
            stringData: jsonEncode(jsonDecode(value["body"])),
            prefKey: StorageKey.assetData);
      } else {
        printData("getAssetData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

  Future<void> subCategoryData({required String catId}) async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
        url: "${APIEndPoints.subCategoryUrl}?cat_id=$catId").then((value) async {
      if (value['error'] == null) {
        printData("subCategoryData Api ==> ${value['body']}");

      } else {
        printData("subCategoryData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

  Future<void> getCategoryData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
        url: APIEndPoints.categoryUrl).then((value) async {
      if (value['error'] == null) {
        printData("categoryData Api ==> ${value['body']}");

      } else {
        printData("categoryData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

}