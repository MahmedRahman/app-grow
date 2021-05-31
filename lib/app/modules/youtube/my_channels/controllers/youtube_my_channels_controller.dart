import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channels/model/youtube_channels_model.dart';

class YoutubeMyChannelsController extends GetxController {
  //TODO: Implement YoutubeMyChannelsController
  var youtubeChannelsList = Future.value().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  getMyChannels() async {
    ResponsModel responsModel = await WebServices().getMyChannels();
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        final channelListModel = channelListModelFromJson(response.bodyString);
        print(channelListModel.data.first.title);
        youtubeChannelsList.value = Future.value(channelListModel.data);
      }
    }
  }

  setRegisterChannel({String channelID}) async {
    ResponsModel responsModel =
        await WebServices().setRegisterChannel(channelID);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar(AppName, 'تم التسجيل');
        getMyChannels();
      }
    }
  }

  setUnRegisterChannel({String channelID}) async {
    ResponsModel responsModel =
        await WebServices().setUnRegisterChannel(channelID);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        Get.snackbar(AppName, 'تم الغاء التسجيل');
        getMyChannels();
      }
    }
  }
}
