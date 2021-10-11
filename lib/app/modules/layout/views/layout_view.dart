import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/category/views/category_view.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/package/views/package_view.dart';
import 'package:grow/app/modules/payment/views/payment_view.dart';
import 'package:grow/app/modules/profile/views/profile_view.dart';
import 'package:grow/app/modules/profile/views/provile_detailes_view.dart';

import '../controllers/layout_controller.dart';

var BottomNavigationIndex = 0.obs;

class LayoutView extends GetView<LayoutController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          title: 'Exit',
          content: Text('Are you sure you want to exit ?'),
          confirm: TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              child: Text('Confirm')),
          cancel: TextButton(
              onPressed: () {
                Get.back();
                return false;
              },
              child: Text('Cancel')),
        );
        return false;
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: KprimaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on_sharp),
              label: 'Payment'.tr,
            ),
       
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'.tr,
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: HomeView(),
                );
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: PaymentView(),
                );
              });
        
            case 2:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: ProfileDetailesView(),
                );
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: ProfileView(),
                );
              });
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: HomeView(),
                );
              });
          }
        },
      ),
    );
  }
}
