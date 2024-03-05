import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: Get.find<ChartController>(),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              surfaceTintColor: AppColor.transparentColor,
              backgroundColor: AppColor.transparentColor,
              leading: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        SizedBox(
                            height: size.height(24),
                            width: size.width(24),
                            child: Icon(
                              Icons.arrow_back,
                              size: size.height(24),
                              color: AppColor.blackColor,
                            )),
                        Text(
                          "back".tr,
                          style: AppTextStyle.regularText,
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(left: 15),
              centerTitle: true,
              title: Text("current_news".tr),
              titleTextStyle:
              AppTextStyle.appbarTitleText.copyWith(color: AppColor.blackColor),
              leadingWidth: 100,
              automaticallyImplyLeading: false,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SfCartesianChart(
                      // title: ChartTitle(
                      //     text: "Title"
                      // ),
                      series: <CartesianSeries>[
                        LineSeries<ChartData, int>(
                          dataSource: controller.chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          color: Colors.green,
                        ),
                      ]
                  ),
                  size.heightSpace(20),
                  Text("Your Assets", style: AppTextStyle.regularSubTitleText.copyWith(fontWeight: FontWeight.w700)),
                  Text("124,420.50", style: AppTextStyle.largeSemiBoldText,),
                  RichText(
                    text: TextSpan(
                      text: 'You gained ',
                      style: AppTextStyle.regularSubTitleText.copyWith(
                          color: AppColor.k7A7A7A
                      ),
                      children: <TextSpan>[
                        TextSpan(text: '+\$420.00 ', style: AppTextStyle.regularSubTitleText.copyWith(
                            color: AppColor.k377E36
                        )),
                        TextSpan(
                          text: 'this week',
                          style: AppTextStyle.regularSubTitleText.copyWith(
                              color: AppColor.k7A7A7A
                          ),),
                      ],
                    ),
                  ),
                  // size.heightSpace(30),
                  // TabBar(
                  //   controller: controller.tabController,
                  //     indicatorSize: TabBarIndicatorSize.tab,
                  //     dividerHeight: 0,
                  //     overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  //     indicator: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(6), // Creates border
                  //         color: Colors.greenAccent),
                  //   tabs: [
                  //     Tab(text: "All Assets"),
                  //     Tab(text: "Crypto"),
                  //   ],
                  // ),
                  // Container(
                  //   height: size.height(100),
                  //   // color: Colors.red,
                  //   child: TabBarView(
                  //     controller: controller.tabController,
                  //     children: [
                  //       Text("Assets"),
                  //       Text("Assets")
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
        );
      },
    );
  }
}