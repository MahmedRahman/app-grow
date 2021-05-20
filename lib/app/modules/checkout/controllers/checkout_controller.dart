import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/home/views/home_view.dart';
import 'package:grow/app/modules/layout/views/layout_view.dart';
import 'package:grow/app/modules/package/controllers/package_controller.dart';
import 'package:grow/app/modules/payment/controllers/payment_controller.dart';
import 'package:grow/app/modules/payment/views/payment_view.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  setPackageSubscribe(String Packagid, BuildContext context) async {
    ResponsModel responsModel =
        await WebServices().setPackageSubscribe(Packagid);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar(AppName, 'Payment Done', backgroundColor: KprimaryColor,
            snackbarStatus: (SnackbarStatus status) {
          if (status == SnackbarStatus.CLOSED) {
            //BottomNavigationIndex.value = 1;

            Navigator.pushAndRemoveUntil(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) => new HomeView(),
                ),
                (route) => false);

            // Get.create(() => PaymentController());
            // Get.find<PaymentController>().getMyPackages();
          }
        });
      } else {
        Get.snackbar(
          AppName,
          'Payment Not Done',
          backgroundColor: KprimaryColor,
        );
      }
    }
  }
}
