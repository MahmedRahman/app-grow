import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: KprimaryColor,
        accentColor: KaccentColor,
        scaffoldBackgroundColor: KaccentColor,
        fontFamily: 'Cairo',
      ),
    ),
  );
}
