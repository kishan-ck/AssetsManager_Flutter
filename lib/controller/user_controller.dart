import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:assetsmanagement/utils/widgets/custometile.dart' as c;
import 'package:get/get.dart';

class UserController extends GetxController{

  TextEditingController searchUserAssetsTextController = TextEditingController();
  TextEditingController myPartnerNameTextController = TextEditingController();
  TextEditingController myPartnerOwnedTextController = TextEditingController();
  TextEditingController myPartnerPhoneTextController = TextEditingController();

  c.ExpansionTileController myPartnerExpansionTileController = c.ExpansionTileController();
  c.ExpansionTileController mainPartnerExpansionTileController = c.ExpansionTileController();

  String subTitle = "Partner - 1";
  String title = "My Partners";

  bool isExpanseChange = false;
  bool isSubExpanseChange = false;

  List userCategoryData = [
    {
      "type":"Land",
      "color": AppColor.primaryColor,
      "icon": AppImagePath.landIcon,
      "Quantity": "2 Acre",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type":"Flat",
      "color": AppColor.secondPrimaryColor,
      "icon": AppImagePath.realEstateIcon,
      "Quantity": "1141 ft2",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type":"Land",
      "color": AppColor.lightGreenColor,
      "icon": AppImagePath.landIcon,
      "Quantity": "2 Acre",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
    {
      "type":"Flat",
      "color": AppColor.lightRedColor,
      "icon": AppImagePath.realEstateIcon,
      "Quantity": "1141 ft2",
      "location": "Adajan, Surat",
      "isSolelyOwned": true,
    },
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

  List categoryDataColor = [
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
    AppColor.lightRedColor,
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
  ];
}