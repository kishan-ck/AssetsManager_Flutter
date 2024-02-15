import 'dart:convert';

import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/models/global/home_data_model.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  TextEditingController globalSearchTextController = TextEditingController();
  TextEditingController searchSubCategoryTextController = TextEditingController();
  int currentIndex = 0;
  int selectedIndex = 0;
  
  bool isLoading = false;
  late HomeDataModel homeDataModel;

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
  List categoryDataColor = [
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
    AppColor.lightRedColor,
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
  ];

  Future<void> homeData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
        url: APIEndPoints.homeUrl).then((value) async {
      if (value['error'] == null) {
        printData("homeData Api ==> ${value['body']}");
        homeDataModel = HomeDataModel.fromJson(json.decode(value['body']));

        await setDataToLocalStorage(
            dataType: StorageKey.stringType,
            stringData: jsonEncode(jsonDecode(value["body"])),
            prefKey: StorageKey.homeData);
      } else {
        printData("homeData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

  Future<void> getNewsData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(
        url: APIEndPoints.newsUrl).then((value) async {
      if (value['error'] == null) {
        printData("getNewsData Api ==> ${value['body']}");

      } else {
        printData("getNewsData Api Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });

    isLoading = false;
    update();
  }

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
