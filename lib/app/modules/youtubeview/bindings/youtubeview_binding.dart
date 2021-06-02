import 'package:get/get.dart';

import '../controllers/youtubeview_controller.dart';

class YoutubeviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeviewController>(
      () => YoutubeviewController(),
    );
  }
}
