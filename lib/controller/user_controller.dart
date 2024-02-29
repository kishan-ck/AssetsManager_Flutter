import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;
import 'package:get/get.dart';

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

  String subTitle = "Partner - 1";
  String title = "My Partners";

  bool isExpanseChange = false;
  bool isSubExpanseChange = false;
  bool isNoDataFound = false;

  List<a.Data> searchAssetsList = [];

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
}
