import 'dart:convert';

import 'package:get/get.dart';
import 'package:grow/app/api/response_model.dart';
import 'package:grow/app/api/web_serives.dart';
import 'package:grow/app/data/app_constand.dart';
import 'package:grow/app/modules/youtubeview/model/video_model.dart';

class YoutubeviewController extends GetxController {
  //TODO: Implement YoutubeviewController

  final count = 0.obs;

  var VideoList = Future.value().obs;

  @override
  void onInit() {
    super.onInit();
    getViewVideosList();
  }

  getViewVideosList() async {
    ResponsModel responsModel = await WebServices().getViewVideosList();

    if (responsModel.success) {
      Response response = responsModel.data;
      print(jsonDecode(response.bodyString));

      Viedo viedo = Viedo.fromJson(jsonDecode(response.bodyString));

      VideoList.value = Future.value(viedo);
    }
  }

  setViewVideosBalance({String ViewVideoId}) async {
    ResponsModel responsModel =
        await WebServices().setViewVideosBalance(ViewVideoId: ViewVideoId);

    if (responsModel.success) {
      Response response = responsModel.data;
   


    }

  }
}
