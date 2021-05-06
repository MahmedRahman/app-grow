import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channels/model/youtube_channels_model.dart';
import 'package:grow/app/modules/youtube/channels/views/youtube_channels_view.dart';

class YoutubeChannelsController extends GetxController {
  //TODO: Implement YoutubeChannelsController

  @override
  void onInit() {
    super.onInit();
    getYoutubeChannelList();
  }

  var youtubeChannelsList = Future.value().obs;

  getYoutubeChannelList() async {
    ResponsModel responsModel = await WebServices().getChannelsList();
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        final channelListModel = channelListModelFromJson(response.bodyString);
        youtubeChannelsList.value = Future.value(channelListModel.data);
      } else {
        print(response.bodyString);
        youtubeChannelsList.value = Future.value(null);
      }
    }
  }

  setChannelSubscribe(String channelId) async {
    ResponsModel responsModel =
        await WebServices().setChannelSubscribe(channelId);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar('Grow App', 'Subscribed Successfully',backgroundColor: KprimaryColor);
      } else {
        Get.snackbar('Grow App', 'You Already Subscribed To This Channel',backgroundColor: KprimaryColor);
      }
    }
  }
}
