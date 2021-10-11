import 'package:get/get.dart';

import '../controllers/category_video_controller.dart';

class CategoryVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryVideoController>(
      () => CategoryVideoController(),
    );
  }
}
