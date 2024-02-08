import 'package:assetsmanagement/constants/app_colors.dart';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/image_path.dart';
import 'package:flutter/material.dart';

class InternetErrorScreen extends StatelessWidget {
  const InternetErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Oops,\nWe experienced a Delayed Offline.",
                style: TextStyle(color: AppColor.primaryColor,fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            size.heightSpace(20),
            Image.asset(AppImagePath.networkError),
          ],
        ));
  }
}
