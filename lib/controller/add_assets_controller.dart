import 'package:assetsmanagement/constants/image_path.dart';
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


}