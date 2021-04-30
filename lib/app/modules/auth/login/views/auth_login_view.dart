import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/routes/app_pages.dart';

import '../controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(

          children: [
            SizedBox(
              height: Get.height * .1,
            ),
            Text(
              'Login',
              style: styleTextTitle,
               textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade300),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade300),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.LAYOUT);
                },
                style: ElevatedButton.styleFrom(
                  primary: KprimaryColor,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: KaccentColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.AUTH_FORGET);
                },
                child: Text(
                  'Forget your password ?',
                  style: styleInkWell,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('images/facebok_icon.png'),
                label: Text(
                  'Login with facebok',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff1877F2),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset('images/gmail_icon.png'),
                label: Text(
                  'Login with Gmail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.AUTH_SIGNUP);
                },
                child: Text(
                  'Create an Account ? Signup',
                  style: styleInkWell,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
