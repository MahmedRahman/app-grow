import 'package:get/get.dart';

import '../controllers/auth_forget_controller.dart';

class AuthForgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthForgetController>(
      () => AuthForgetController(),
    );
  }
}
