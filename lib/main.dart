import 'package:assetsmanagement/config/root_binding.dart';
import 'package:assetsmanagement/constants/localization.dart';
import 'package:assetsmanagement/screen/main_screens/add_asset_flow/assets_form_screen.dart';
import 'package:assetsmanagement/screen/main_screens/global_flow/global_screen.dart';
import 'package:assetsmanagement/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: GetMaterialApp(
          title: 'Assets Management',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              fontFamily: "DMSans"),
          initialBinding: RootBinding(),
          translations: Localization(),
          fallbackLocale: const Locale('en', 'US'),
          locale: const Locale('en', 'US'),
          home: const SplashScreen()),
    );
  }
}
