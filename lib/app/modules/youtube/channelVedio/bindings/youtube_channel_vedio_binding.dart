import 'package:get/get.dart';

import '../controllers/youtube_channel_vedio_controller.dart';

class YoutubeChannelVedioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeChannelVedioController>(
      () => YoutubeChannelVedioController(),
    );
  }
}
