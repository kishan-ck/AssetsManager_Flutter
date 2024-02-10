import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  TextEditingController globalSearchTextController = TextEditingController();
  int currentIndex = 0;
  int selectedIndex = 0;

  final items = [
    Image.asset(
      AppImagePath.newsImage1,
      fit: BoxFit.fill,
    ),
    Image.asset(
      AppImagePath.newsImage1,
      fit: BoxFit.fill,
    ),
    Image.asset(
      AppImagePath.newsImage1,
      fit: BoxFit.fill,
    ),
    Image.asset(
      AppImagePath.newsImage1,
      fit: BoxFit.fill,
    ),
  ];

  List categoryData = [
    "Residential",
    "Commercial",
    "Agricultural",
    "Industrial",
    "Vacant",
    "Urban",
    "Rural"
  ];

  ListView horizontalList(int n) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        n,
        (i) => GestureDetector(
          onTap: () {
            selectedIndex = i;
            update();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.only(right: size.width(21), top: 5, bottom: 10),
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == i ? AppColor.secondPrimaryColor : AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(1, 2))
                ]),
            alignment: Alignment.center,
            child: Text('${categoryData[i]}',style: AppTextStyle.regularText.copyWith(color: selectedIndex == i ? AppColor.whiteColor : AppColor.blackColor),),
          ),
        ),
      ),
    );
  }
}
