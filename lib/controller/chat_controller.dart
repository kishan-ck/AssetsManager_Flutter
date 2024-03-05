import 'dart:convert';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/config/network_handler.dart';
import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:assetsmanagement/models/auth/error_model.dart';
import 'package:assetsmanagement/models/global/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartController extends GetxController
    with GetSingleTickerProviderStateMixin {

  late TabController tabController =
  TabController(length: 2, vsync: this);

  bool isLoading = false;
  ChartModel? chartModel;

  final List<ChartData> chartData = [
    ChartData(2010, 1),
    ChartData(2011, 13),
    ChartData(2012, 34),
    ChartData(2013, 27),
    ChartData(2014, 40)
  ];

  Future<void> getChartData() async {
    isLoading = true;
    update();
    await HttpHandler.getHttpMethod(url: APIEndPoints.chartUrl())
        .then((value) async {
      if (value['error'] == null) {
        printData("Chart Data Api ==> ${value['body']}");
        chartModel = ChartModel.fromJson(json.decode(value['body']));
        isLoading = false;
        update();
      } else {
        printData("Chart Data Error==> ${value['error']}");
        ErrorModel error = ErrorModel.fromJson(json.decode(value['body']));
        commonSnackBar(message: "${error.message}");
        return null;
      }
    });
    isLoading = false;
    update();
  }

}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}
