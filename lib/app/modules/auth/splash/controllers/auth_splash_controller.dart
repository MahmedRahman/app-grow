import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grow/app/routes/app_pages.dart';

class AuthSplashController extends GetxController {
  //TODO: Implement AuthSplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.userChanges().listen((User user) {
      if (user == null) {
        Get.toNamed(Routes.AUTH_SPLASH);
      } else {
        Get.toNamed(Routes.LAYOUT);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
