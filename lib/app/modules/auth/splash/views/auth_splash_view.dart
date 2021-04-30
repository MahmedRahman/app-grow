import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/auth_splash_controller.dart';

class AuthSplashView extends GetView<AuthSplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: KprimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('images/logo.png'),
            SizedBox(
              height: Get.height * .1,
            ),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                
                onPressed: () {
                  Get.toNamed(Routes.AUTH_SIGNUP);
                },
                style: ElevatedButton.styleFrom(
                  
                  primary: Color(0xffF2F2F2),
                ),
                child: Text(
                  'Signup',
                  style: TextStyle(
                    color: Color(0xff438A5D),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: Get.width,
               height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.AUTH_LOGIN);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffF2F2F2),
                ),
                child: Text(
                  'login',
                  style: TextStyle(
                    color: Color(0xff438A5D),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .2,
            )
          ],
        ),
      ),
    ));
  }
}
