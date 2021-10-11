import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtube/channelVedio/model/my_vedio.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/channel_info.dart';
import 'package:grow/app/modules/youtube/channelVedio/models/viideos_list.dart';

class YoutubeChannelVedioController extends GetxController {
  //TODO: Implement YoutubeChannelVedioController

  //var ChannelViedoInfo = Future.value().obs;
  //var ChannelViedoList = Future.value().obs;

  var myVideo = Future.value().obs;

  final count = 0.obs;

  var channel = '';

  var category;

  @override
  void onInit() {
    super.onInit();
  }

  getChannelViedoList(String channelID) async {
    channel = channelID;

    ResponsModel responseModel =
        await WebServices().getVideosList(chanelID: channelID);

    if (responseModel.success) {
      Response response = responseModel.data;

      if (response.body['success']) {
        final myVideoModel = myVideoModelFromJson(response.bodyString);

        myVideo.value = Future.value(myVideoModel);

        print(myVideoModel);
      }
    }
  }

  Future getCategory() async {
    ResponsModel responseModel =
        await WebServices().getCategories();

    if (responseModel.success) {
      Response response = responseModel.data;
      categoriesItems.value = response.body['data'];
      return response.body['data'];
    }
  }

  Future getsubCategory({@required String subCategories}) async {
    ResponsModel responseModel =
        await WebServices().getSubCategories(sub_categories: subCategories);

    if (responseModel.success) {
      Response response = responseModel.data;
      return response.body['data'];
    }
  }

  setRegistered({String videoID}) async {
    ResponsModel responseModel = await WebServices()
        .setRegisterVideo(videoID: videoID, category: category);

    if (responseModel.success) {
      Response response = responseModel.data;

print(response.bodyString);

      if (response.body['success']) {
        Get.snackbar(AppName, 'تم تسجيل الفيديو');
        getChannelViedoList(channel);
      }
    }
  }

  setUnRegistered({String videoID}) async {
    ResponsModel responseModel = await WebServices()
        .setUnRegisterVideo(videoID: videoID, category: category);

    if (responseModel.success) {
      Response response = responseModel.data;
      if (response.body['success']) {
        Get.snackbar(AppName, 'تم الغاء تسجيل الفيديو');
        getChannelViedoList(channel);
      }
    }
  }
}
