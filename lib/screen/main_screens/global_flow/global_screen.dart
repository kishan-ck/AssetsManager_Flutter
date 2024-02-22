import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:assetsmanagement/controller/global_controller.dart';
import 'package:assetsmanagement/controller/login_controller.dart';
import 'package:assetsmanagement/screen/main_screens/global_flow/view_all_category_screen.dart';
import 'package:assetsmanagement/utils/widgets/custom_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: GetBuilder(
            init: Get.find<GlobalController>(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "hello".tr,
                                style: AppTextStyle.regularHeadingText,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${Get.find<LoginController>().loginModel?.data?.fullname ?? ""}!",
                                      style: AppTextStyle.regularHeadingText
                                          .copyWith(
                                              color:
                                                  AppColor.secondPrimaryColor,
                                              fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Text(
                              "here_you_can_search_global_assets".tr,
                              style: AppTextStyle.regularSubTitleText,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(9),
                          decoration: const BoxDecoration(
                            color: AppColor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(AppImagePath.notificationsIcon,
                              height: size.height(20)),
                        ),
                      ],
                    ),
                    size.heightSpace(18),
                    CustomTextField(
                      controller: controller.globalSearchTextController,
                      fillColor: AppColor.greyColor.withOpacity(0.1),
                      isUnderLineBorderRadius: BorderRadius.circular(100),
                      isShadow: false,
                      hintText: "search_category".tr,
                      underLineFocusColor: AppColor.primaryColor,
                      suffixIcn: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColor.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(AppImagePath.searchIcon,
                            height: size.height(24)),
                      ),
                    ),
                    size.heightSpace(11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(AppImagePath.newsIcon,
                            height: size.height(24)),
                        size.widthSpace(9.05),
                        Text(
                          "news".tr,
                          style: AppTextStyle.largeText
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    size.heightSpace(15),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 150,
                        viewportFraction: 1.9,
                        aspectRatio: 1.0,
                        enlargeFactor: 1.0,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          controller.currentIndex = index;
                          controller.update();
                        },
                      ),
                      items: controller.items,
                    ),
                    size.heightSpace(10),
                    Align(
                      alignment: Alignment.center,
                      child: DotsIndicator(
                        dotsCount: controller.items.length,
                        // dotsCount: controller.homeDataModel.data?.news?.length ?? 0,
                        position: controller.currentIndex,
                        decorator: const DotsDecorator(
                            activeColor: AppColor.primaryColor),
                      ),
                    ),
                    size.heightSpace(16),
                    ListView.builder(
                      itemCount:
                          controller.homeDataModel?.data?.category?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(AppImagePath.landIcon,
                                    height: size.height(24)),
                                size.widthSpace(9.05),
                                Text(
                                  controller.homeDataModel?.data
                                          ?.category?[index].name ??
                                      "",
                                  style: AppTextStyle.largeText
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                const Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(() => ViewAllCategoryScreen(
                                          categoryData: controller.homeDataModel
                                              ?.data?.category?[index]));
                                    },
                                    child: Text(
                                      "view_all".tr,
                                      style: AppTextStyle.regularText.copyWith(
                                          color: AppColor.primaryColor),
                                    )),
                              ],
                            ),
                            size.heightSpace(15),
                            SizedBox(
                                height: 100,
                                child: controller.horizontalList(controller
                                    .homeDataModel!.data!.category![index])),
                          ],
                        );
                      },
                    ),
                  ],
                ).paddingAll(15),
              );
            }).paddingAll(15),
      ),
    );
  }
}
