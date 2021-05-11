import 'package:get/get.dart';
import 'package:grow/app/api/youtub_serives.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';

class YoutubeChannelVedioController extends GetxController {
  //TODO: Implement YoutubeChannelVedioController

  var ChannelViedoInfo = Future.value().obs;
  var ChannelViedoList = Future.value().obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  getChannelViedoList(String channelID) async {
    String response =
        await YoutubServices().getChannelInfo(channelID: channelID);

    ChannelInfo channelInfo = channelInfoFromJson(response);
    //ChannelViedoInfo.value = Future.value(channelInfo);

    getChannelPlayViedoList(
        channelInfo.items.first.contentDetails.relatedPlaylists.uploads);
  }

  getChannelPlayViedoList(String playListId) async {
    String response = await YoutubServices()
        .getVideosList(pageToken: '', playListId: playListId);

    final videosList = videosListFromJson(response);
    ChannelViedoList.value = Future.value(videosList);
  }
}
