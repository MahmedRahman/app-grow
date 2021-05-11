import 'package:get/get.dart';

import '../controllers/youtube_my_channels_controller.dart';

class YoutubeMyChannelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeMyChannelsController>(
      () => YoutubeMyChannelsController(),
    );
  }
}
