import 'dart:convert';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/setting_controller.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:flutter/material.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;
import 'package:get/get.dart';
import '../constants/custom_snackbar.dart';
import '../models/asset/asset_model.dart' as a;

class UserController extends GetxController {
  TextEditingController searchUserAssetsTextController =
      TextEditingController();
  TextEditingController myPartnerNameTextController = TextEditingController();
  TextEditingController myPartnerOwnedTextController = TextEditingController();
  TextEditingController myPartnerPhoneTextController = TextEditingController();

  c.ExpansionTileController myPartnerExpansionTileController =
      c.ExpansionTileController();
  c.ExpansionTileController mainPartnerExpansionTileController =
      c.ExpansionTileController();

  String title = "My Partners";

  bool isExpanseChange = false;
  bool isSubExpanseChange = false;
  bool isNoDataFound = false;
  bool isLoading = false;

  List<a.Data> searchAssetsList = [];
  List<a.Partner> showPartnerList = [];

  List userCategoryData = [
    {
      "type": "Land",
      "color": AppColor.primaryColor,
      "icon": AppImagePath.landIcon,
      "Quantity": "2 Acre",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type": "Flat",
      "color": AppColor.secondPrimaryColor,
      "icon": AppImagePath.realEstateIcon,
      "Quantity": "1141 ft2",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type": "Land",
      "color": AppColor.lightGreenColor,
      "icon": AppImagePath.landIcon,
      "Quantity": "2 Acre",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type": "Flat",
      "color": AppColor.lightRedColor,
      "icon": AppImagePath.realEstateIcon,
      "Quantity": "1141 ft2",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
  ];

  final List<Color> categoryColor = [
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
    AppColor.lightRedColor,
  ];

  final List<String> imageUrls = [
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
    AppImagePath.myAssetImage,
  ];

  searchData({required String value}){
    List<a.Data>? assetList = Get.find<SettingController>().assetModel?.data;
    printData("search list data :: ${ Get.find<SettingController>().assetModel?.data}");

    if (assetList != null ) {
      printData('Assets List ==> $assetList');
      searchAssetsList = assetList.where((element) {
        if(element.subCategoryId?.catId != null){
        if (element.subCategoryId!.catId!.name!.toLowerCase().contains(value.toLowerCase())) {
          return element.subCategoryId!.catId!.name!.toLowerCase().contains(value.toLowerCase());
        } else if (element.numberOfMeasurement.toString()
            .contains(value)) {
          return element.numberOfMeasurement!.toString()
              .contains(value);
        } else if (element.location!
            .toLowerCase()
            .contains(value.toLowerCase())) {
          return element.location!.toLowerCase().contains(value.toLowerCase());
        }}
        return false;
      }).toList();
      update();
      // printData("search list :: ${searchAssetsList[0].name}");
    }
  }


  Future<void> deleteAssetData({required String assetId}) async {
    isLoading = true;
    update();
    await HttpHandler.deleteHttpMethod(url: APIEndPoints.deleteAssetUrl(assetId: assetId))
        .then((value) async {
      if (value['error'] == null) {
        printData("Delete Assets Api ==> ${value['body']}");
        await Get.find<SettingController>().getAssetData();
        commonSnackBar(message: "Asset Delete Successfully", isError: false);
        Get.find<SettingController>().update();
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
