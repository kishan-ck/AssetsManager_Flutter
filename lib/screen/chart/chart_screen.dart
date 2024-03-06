import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/chart_controller.dart';
import 'package:assetsmanagement/models/global/home_data_model.dart';
import 'package:assetsmanagement/utils/widgets/app_loader.dart';
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
        return Stack(
          children: [
                Scaffold(
                  resizeToAvoidBottomInset: false,
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
                  title: const Text("Asset Analysis"),
                  titleTextStyle: AppTextStyle.appbarTitleText
                      .copyWith(color: AppColor.blackColor),
                  leadingWidth: 100,
                  automaticallyImplyLeading: false,
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SfCartesianChart(
                          series: <CartesianSeries>[
                            LineSeries<ChartData, int>(
                              dataSource: controller.chartData1,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              color: Colors.green,
                            ),
                          ]),
                      size.heightSpace(20),
                      Text("Your Assets",
                          style: AppTextStyle.regularSubTitleText
                              .copyWith(fontWeight: FontWeight.w700)),
                      Text(
                        "124,420.50",
                        style: AppTextStyle.largeSemiBoldText,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'You gained ',
                          style: AppTextStyle.regularSubTitleText
                              .copyWith(color: AppColor.k7A7A7A),
                          children: <TextSpan>[
                            TextSpan(
                                text: '+\$420.00 ',
                                style: AppTextStyle.regularSubTitleText
                                    .copyWith(color: AppColor.k377E36)),
                            TextSpan(
                              text: 'this week',
                              style: AppTextStyle.regularSubTitleText
                                  .copyWith(color: AppColor.k7A7A7A),
                            ),
                          ],
                        ),
                      ),
                      size.heightSpace(30),
                      Text(
                        "All Assets",
                        style: AppTextStyle.mediumTitleText,
                      ),
                      size.heightSpace(10),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.chartModel?.data?.subcategory?.length ?? 0,
                          itemBuilder: (context, index) {
                            int profitValue = controller.chartModel?.data?.subcategory?[index].profitval ?? 0;
                            return Container(
                              height: 55,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: AppColor.greyColor.withOpacity(0.5))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(controller.chartModel?.data?.subcategory?[index].name ?? ""),
                                  Image.asset(
                                    (profitValue > 0) ? AppImagePath.profitChartIcon : AppImagePath.loseChartIcon,
                                    width: size.width(40),
                                  ),
                                  size.widthSpace(10),
                                  Text(controller.chartModel?.data?.subcategory?[index].currentval.toString() ?? ""),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: size.width(4), vertical: size.height(2)),
                                    decoration: BoxDecoration(
                                      color: (profitValue > 0) ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text("${controller.chartModel?.data?.subcategory?[index].profitval.toString() ?? ""} %",
                                      style: TextStyle(color: (profitValue > 0) ? Colors.green : Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: size.height(5),
                            );
                          },
                        ),
                      ),
                      size.heightSpace(10),
                    ],
                  ),
                )),
            controller.isLoading ? appLoader() : const SizedBox()
              ],
        );
      },
    );
  }
}
