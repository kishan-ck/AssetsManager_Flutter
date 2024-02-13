import 'package:assetsmanagement/constants/image_path.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{

  List menuList = [
    {
      "icon" : AppImagePath.notificationIcon,
      "text": "Notifications",
    },
    {
      "icon" : AppImagePath.languageIcon,
      "text": "Language",
    },
    {
      "icon" : AppImagePath.shieldIcon,
      "text": "Privacy",
    },
    {
      "icon" : AppImagePath.infoIcon,
      "text": "About Us",
    }
  ];

}