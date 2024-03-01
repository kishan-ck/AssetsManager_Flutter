import 'dart:convert';

import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
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
  TextEditingController searchSubCategoryTextController =
      TextEditingController();
  int currentIndex = 0;
  int selectedIndex = 0;
  int passIndex = 0;

  bool isLoading = false;
  bool isNoDataFound = false;
  bool isSubCategoryNoDataFound = false;

  HomeDataModel? homeDataModel;

  List searchAssetsList = [];
  List searchSubCategoryList = [];

  final items = [
    AppImagePath.newsImage1,
  ];

  // List categoryData = [
  //   "Residential",
  //   "Commercial",
  //   "Agricultural",
  //   "Industrial",
  //   "Vacant",
  //   "Urban",
  //   "Rural"
  // ];
  List categoryDataColor = [
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
    AppColor.lightRedColor,
    AppColor.primaryColor,
    AppColor.secondPrimaryColor,
    AppColor.lightGreenColor,
  ];

  String addOrdinalSuffix(String formattedDate) {
    String day = formattedDate.split(' ')[1];
    String suffix = '';
    if (day.endsWith('1')) {
      suffix = 'st';
    } else if (day.endsWith('2')) {
      suffix = 'nd';
    } else if (day.endsWith('3')) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }
    return formattedDate.replaceAllMapped(
        RegExp(r'\b\d{1,2}\b'), (Match m) => m.group(0)! + suffix);
  }

  Future<void> homeData() async {
    isLoading = true;
    update();

    await HttpHandler.getHttpMethod(url: APIEndPoints.homeUrl)
        .then((value) async {
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

    await HttpHandler.getHttpMethod(url: APIEndPoints.newsUrl)
        .then((value) async {
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

  ListView horizontalList(Category category) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        category.subcategory?.length ?? 0,
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
                color: AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.25),
                      blurRadius: 9,
                      spreadRadius: 0,
                      offset: const Offset(2, 4))
                ]),
            alignment: Alignment.center,
            child: Text(
              category.subcategory?[i].name ?? "",
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.regularText.copyWith(color: AppColor.blackColor),
            ),
          ),
        ),
      ),
    );
  }

  searchData({required String value}){
    List<Category>? assetList = homeDataModel?.data?.category;
    printData("search list data :: $assetList");
    if (assetList != null ) {
      printData('Assets List ==> $assetList');
      searchAssetsList = assetList.where((element) {
        if(element.name != null){
          if (element.name!.toLowerCase().contains(value.toLowerCase())) {
            return element.name!.toLowerCase().contains(value.toLowerCase());
          }}
        return false;
      }).toList();
      update();
      // printData("search list :: ${searchAssetsList[0].name}");
    }
  }

  searchSubCategoryData({required String value}){
    List<Subcategory>? assetList = homeDataModel?.data?.category?[passIndex].subcategory;
    printData("search list data :: $assetList");

    if (assetList != null ) {
      printData('Assets List ==> $assetList');
      searchSubCategoryList = assetList.where((element) {
        if(element.name != null){
          if (element.name!.toLowerCase().contains(value.toLowerCase())) {
            return element.name!.toLowerCase().contains(value.toLowerCase());
          }}
        return false;
      }).toList();
      update();
      // printData("search list :: ${searchAssetsList[0].name}");
    }
}

}

