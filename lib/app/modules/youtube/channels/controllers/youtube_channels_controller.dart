import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channels/model/Chanel_list.dart';

class YoutubeChannelsController extends GetxController {
  //TODO: Implement YoutubeChannelsController

  @override
  void onInit() {
    super.onInit();
    //getYoutubeChannelList();
  }

  var youtubeChannelsList = Future.value().obs;

  getYoutubeChannelList() async {
    ResponsModel responsModel = await WebServices().getChannelsList();

    if (responsModel.success) {
      Response response = responsModel.data;
      print(response.bodyString);

      if (response.body['success']) {
        final channelsListModel =
            channelsListModelFromJson(response.bodyString);

        youtubeChannelsList.value = Future.value(channelsListModel.data);
      } else {
        print(response.bodyString);
      }
    }
  }

  setChannelSubscribe(String channelId) async {
    ResponsModel responsModel =
        await WebServices().setChannelSubscribe(channelId);
    print('Subscribe Response: ${responsModel.data.body}');
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        getYoutubeChannelList();
        Get.snackbar(
          'Grow App',
          'Subscribed Successfully',
          backgroundColor: KprimaryColor,
          snackbarStatus: (SnackbarStatus Status) {
            if (Status == SnackbarStatus.CLOSING) {}
          },
        );
      } else {
        print('Error: ${response.body}');
        Get.snackbar('Grow App', 'You Already Subscribed To This Channel',
            backgroundColor: KprimaryColor);
      }
    }
  }
}
