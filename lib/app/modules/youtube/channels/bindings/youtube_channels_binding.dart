import 'package:get/get.dart';

import '../controllers/youtube_channels_controller.dart';

class YoutubeChannelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeChannelsController>(
      () => YoutubeChannelsController(),
    );
  }
}
