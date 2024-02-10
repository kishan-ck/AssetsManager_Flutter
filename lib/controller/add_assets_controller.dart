import 'package:assetsmanagement/constants/image_path.dart';
import 'package:get/get.dart';

class AddAssetsController extends GetxController{

  bool startAnimation = false;

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