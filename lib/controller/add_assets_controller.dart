import 'dart:convert';
import 'dart:io';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/models/asset/add_assets_model.dart';
import 'package:assetsmanagement/models/asset/asset_model.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAssetsController extends GetxController {
  String selectedSubCategoryController = "Metal3";
  String subCatId = "";
  String isSolelyOwned = "No";
  String title = "Partner - 1";
  List<File>? path;
  List<dynamic> uploadedImageString = [];

  AddAssetsModel? addAssetsModel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AssetModel? assetModel;

  TextEditingController assetNameTextController = TextEditingController();
  TextEditingController assetIdTextController = TextEditingController();
  TextEditingController assetQuantityTextController = TextEditingController();
  TextEditingController assetOwnedTextController = TextEditingController();
  TextEditingController assetDescriptionTextController =
      TextEditingController();
  TextEditingController partnerNameTextController = TextEditingController();
  TextEditingController partnerOwnedTextController = TextEditingController();
  TextEditingController partnerPhoneTextController = TextEditingController();
  TextEditingController assetLocationTextController = TextEditingController();

  c.ExpansionTileController partnerExpansionTileController =
      c.ExpansionTileController();

  bool startAnimation = false;
  bool isExpanseChange = false;
  bool isLoading = false;
  bool isValidate = false;

  List<String> subCategoryDropDownItems = [
    "Residential Land",
    "Commercial Land",
    "Agricultural Land",
    "Industrial Land",
    "Vacant Land",
    "Urban Land",
    "Rural Land",
  ];

  List<String> solelyOwnedList = ["Yes", "No"];

  List categoryData = [
    {"type": "Land", "icon": AppImagePath.landIcon, "bg": AppImagePath.landBg},
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

  Future<void> getAssetData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(url: APIEndPoints.assetUrl)
        .then((value) async {
      if (value['error'] == null) {
        printData("getAssetData Api ==> ${value['body']}");
        assetModel = AssetModel.fromJson(json.decode(value['body']));
        // await setDataToLocalStorage(
        //     dataType: StorageKey.stringType,
        //     stringData: jsonEncode(jsonDecode(value["body"])),
        //     prefKey: StorageKey.assetData);
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
    update();
  }

  Future<void> subCategoryData({required String catId}) async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
            url: "${APIEndPoints.subCategoryUrl}?cat_id=$catId")
        .then((value) async {
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

    await HttpHandler.getHttpMethod(url: APIEndPoints.categoryUrl)
        .then((value) async {
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

  void openFileExplorer(
      {bool isMultiSelection = false,
      FileType filePickingType = FileType.image}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: filePickingType,
      allowMultiple: true,
    );

    if (result != null) {
      print("result-----> $result");
      // path = File(result.paths);
      path = result.paths.map((e) {
        return File(e!);
      }).toList();
      uploadImages();
      print("PATH-----> $path");
      update();
    } else {
      // User canceled the picker
    }
  }

  uploadImages() async {
    isLoading = true;
    update();

    await HttpHandler.formHttpMethod(
            url: APIEndPoints.uploadImage,
            methodType: 'POST',
            multipleFile: path,
            multipleFileKey: "image")
        .then((value) async {
      if (value['error'] == null) {
        uploadedImageString = json.decode(value['body'])["data"];
        update();
        printData("uploadImages Api ==> ${value['body']}");
        printData(
            "uploadImages Api ==> ${json.decode(value['body'])["data"].toString()}");
      } else {
        printData("uploadImages Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

  addAssets() async {
    isLoading = true;
    update();
    final userId = await getDataFromLocalStorage(
        dataType: StorageKey.stringType, prefKey: StorageKey.userId);
    await HttpHandler.postHttpMethod(
        url: APIEndPoints.createAsset,
        isEncoded: true,
        data: {
          "name": assetNameTextController.text.trim(),
          "description": assetDescriptionTextController.text.trim(),
          "assetId": assetIdTextController.text.trim(),
          "numberOfMeasurement": assetQuantityTextController.text.trim(),
          "measurementType": 2,
          "isAssetSolelyOwned": isSolelyOwned == "Yes" ? true : false,
          "percentOwned": int.parse(assetOwnedTextController.text.trim()),
          "userId": userId.toString(),
          "subCategoryId": subCatId.toString(),
          "partner": [],
          "images": uploadedImageString
        }).then((value) {
      if (value['error'] == null) {
        addAssetsModel = AddAssetsModel.fromJson(json.decode(value['body']));
        assetNameTextController.clear();
        assetDescriptionTextController.clear();
        assetIdTextController.clear();
        assetQuantityTextController.clear();
        assetOwnedTextController.clear();
        subCatId = "";
        uploadedImageString.clear();
        update();
        commonSnackBar(message: "Assets Added Successfully", isError: false);
        printData("addAssets Api ==> ${value['body']}");
        printData("addAssets addAssetsModel Api ==> $addAssetsModel");
      } else {
        printData("addAssets Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        isLoading = false;
        update();
        return null;
      }
    });

    isLoading = false;
    update();
  }
}
