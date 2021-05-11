import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/package/views/package_view.dart';
import 'package:grow/app/modules/payment/views/payment_view.dart';
import 'package:grow/app/modules/profile/views/profile_view.dart';
import 'package:grow/app/modules/settings/views/settings_view.dart';

import '../controllers/layout_controller.dart';

  var BottomNavigationIndex = 0.obs;

class LayoutView extends GetView<LayoutController> {


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(
        backgroundColor: KaccentColor,
        activeColor: KprimaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ' Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
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
                child: ProfileView(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SettingsView(),
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
    );
  }
}
