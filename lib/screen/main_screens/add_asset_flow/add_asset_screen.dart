import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/app_text_style.dart';
import 'package:assetsmanagement/controller/add_assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({super.key});

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        Get.find<AddAssetsController>().startAnimation = true;
      });
    });

    // Future.delayed(const Duration(milliseconds: 500), (){
    //   Get.find<AddAssetsController>().startAnimation = true;
    //   Get.find<AddAssetsController>().update();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: GetBuilder(
            init: Get.find<AddAssetsController>(),
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back,size: size.height(24)),
                        size.widthSpace(9.05),
                        Text("Back",style: AppTextStyle.regularSubTitleText,),
                      ],
                    ),
                  ),
                  size.heightSpace(15),
                  Text("Select Category",style: AppTextStyle.regularHeadingText.copyWith(fontSize: 30),),
                  Text("You can select any category in which you are interested",style: AppTextStyle.regularSubTitleText,textAlign: TextAlign.center,),
                  size.heightSpace(14),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.categoryData.length,
                    padding: const EdgeInsets.only(bottom: 20),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: size.height(20),),
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.blackColor.withOpacity(0.1),
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  offset: const Offset(1, 2))
                            ],
                            image: DecorationImage(image: AssetImage(controller.categoryData[index]["bg"]),alignment: Alignment.centerRight)
                        ),
                        curve: Curves.easeInOut,
                        transform: Matrix4.translationValues(controller.startAnimation ? 0 : Get.width, 0, 0),
                        duration: Duration(milliseconds: 300 + (index * 200)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(controller.categoryData[index]["icon"],height: size.height(40)),
                            size.widthSpace(20),
                            Text(controller.categoryData[index]["type"] ?? "",style: AppTextStyle.largeText.copyWith(fontSize: 24),),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ).paddingAll(23);
            }
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({
    required this.index,
    required this.controller,
    super.key,
  });
  int index;
  AddAssetsController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColor.blackColor.withOpacity(0.1),
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(1, 2))
          ],
          image: DecorationImage(image: AssetImage(controller.categoryData[index]["bg"]),alignment: Alignment.centerRight)
      ),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(controller.startAnimation ? 0 : Get.width, 0, 0),
      duration: Duration(milliseconds: 300 + (index * 200)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(controller.categoryData[index]["icon"],height: size.height(40)),
          size.widthSpace(20),
          Text(controller.categoryData[index]["type"] ?? "",style: AppTextStyle.largeText.copyWith(fontSize: 24),),
        ],
      ),
    );
  }
}
